//
//  ------------------------------------------------------------------------
//
//  Copyright 2016 Dan Lindholm
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
//  ------------------------------------------------------------------------
//
//  Emojica.swift
//

import Foundation

/// A class to convert the standard emoji representation into something more
/// customised. Images not provided.
public final class Emojica {
    
    public init() {}
    
    /// Initializes an instance that uses the given font.
    /// - parameter font:   The font to be used in converted attributed strings.
    public init(font: UIFont) {
        self.font = font
    }
    
    // Private declarations.
    private var _font: UIFont?
    private var _pointSize: CGFloat = 17.0
    private var _minimumCodePointWidth: UInt = 0
    private var _separator: String = "-"
    private var _imageSet: ImageSet = .default
    
    /// The font to be used for standard text.
    /// - note:     If no font is set, the system font is used.
    public var font: UIFont? {
        get { return _font }
        set {
            _font = newValue
            _pointSize = newValue?.pointSize ?? pointSize
        }
    }
    
    /// The point size to be used for text and emoji.
    /// - note:     17.0 by default.
    public var pointSize: CGFloat {
        get { return _pointSize }
        set {
            _pointSize = newValue
            _font = font?.withSize(newValue)
        }
    }
    
    /// The minimum width used in the names of the imported images. The character `0` is used for padding.
    /// - note:     This value must between 0 and 8.
    public var minimumCodePointWidth: UInt {
        get { return _minimumCodePointWidth }
        set {
            _minimumCodePointWidth = newValue < 8 ? newValue : 8
        }
    }
    
    /// The separator used in the names of the imported images.
    public var separator: String {
        get { return _separator }
        set {
            _separator = newValue
        }
    }
    
    /// The image set used in the project.
    public var imageSet: ImageSet {
        get { return _imageSet }
        set {
            switch newValue {
            case .default:
                self.minimumCodePointWidth = 0
                self.separator = "-"
            case .twemoji:
                self.minimumCodePointWidth = 2
                self.separator = "-"
            case .emojione:
                self.minimumCodePointWidth = 4
                self.separator = "-"
            case .noto:
                self.minimumCodePointWidth = 4
                self.separator = "_"
            }
            self._imageSet = newValue
        }
    }
    
    /// Setting this to `false` will strip out all modifier symbols (🏻, 🏼, 🏽, 🏾 and 🏿).
    /// - note:     This will **not** affect fallbacks.
    public var useModifiers: Bool = true
    
    /// Keep the instance non-revertible if the original strings aren't needed after conversion.
    public var revertible: Bool = false
}

extension Emojica {
    public enum ImageSet: String {
        /// Default parameters.
        case `default` = "Custom"
        /// Twemoji 2.2 compatibility.
        case twemoji = "Twemoji"
        /// Emoji One compatibility.
        case emojione = "Emoji One"
        /// Noto Emoji compatibility.
        case noto = "Noto Emoji"
    }
}

extension Emojica {
    
    /// Replaces the standard emoji with custom emoji from the provided image set.
    /// - parameter string:     The string to convert.
    /// - returns:              An `NSAttributedString` with all the emoji replaced with custom images.
    public func convert(string: String) -> NSAttributedString {
        let attributedString = NSAttributedString(string: string)
        return self.convert(string: attributedString)
    }
    
    /// Replaces the standard emoji with custom emoji from the provided image set.
    /// - parameter string:     The string to convert.
    /// - returns:              An `NSAttributedString` with all the emoji replaced with custom images.
    public func convert(string attributedString: NSAttributedString) -> NSAttributedString {
        let result = NSMutableAttributedString(attributedString: attributedString)
        
        // Create instance of emoji handler.
        let handler = EmojiHandler()
        
        // Create a copy.
        var characters = attributedString.string.characters
        
        // Gather all modifiers to handle.
        var modifiers = characters.filter{ $0.isModifierSymbol }
        
        while !characters.isEmpty {
            
            let character = characters.removeFirst()
            
            // Disregard non-emoji characters.
            guard character.isEmoji else { continue }
            
            // Disregard characters with VS-15.
            if character.hasVariationSelector15 { continue }
            
            // Handle modifier special case.
            if let modifier = modifiers.first, let first = characters.first, modifier == first {
                // Remove modifier from both collections.
                modifiers.removeFirst()
                characters.removeFirst()
                
                if handler.complete { handler.finish() }
                handler.add(characters: character, modifier)
                
                continue
            }
            
            // Handle regional indicators somewhat gracefully.
            if character.hasRegionalIndicatorSymbol {
                let isFlag = character.isFlagSequence
                let scalars = character.unicodeScalars.map{ Character($0) }
                
                var i = 0
                
                while i < scalars.count {
                    if handler.complete { handler.finish() }
                    isFlag ? handler.add(characters: scalars[i], scalars[i + 1]) : handler.add(characters: scalars[i])
                    i += isFlag ? 2 : 1
                }
                
                continue
            }
            
            // Handle remaining emoji.
            if handler.complete { handler.finish() }
            handler.add(characters: character)
        }
        
        // Wrap up the last emoji, even if it isn't complete.
        handler.finish()
        
        // Parse through results and replace.
        for emoji in handler.results {
            
            let range = result.mutableString.range(of: emoji.string)
            
            if let replacement = replacement(for: emoji) {
                result.replaceCharacters(in: range, with: replacement)
            } else {
                result.replaceCharacters(in: range, with: fallback(for: emoji))
            }
        }
        
        let range = result.mutableString.range(of: result.string)
        
        let font = self.font ?? UIFont.systemFont(ofSize: self.pointSize)
        result.addAttribute(NSFontAttributeName, value: font, range: range)
        
        return result
    }
    
    /// Finds a replacement for a sequence.
    /// - parameter emoji:      The `EmojiHandler` instance containing the sequence.
    /// - returns:              An `NSAttributedString` with the replacement as an attachment, or `nil`.
    private func replacement(for emoji: EmojiHandler) -> NSAttributedString? {
        
        var name: String {
            let filtered = self.useModifiers ? emoji.filtered : emoji.filtered.filter{ !$0.isModifierSymbol }
            return filtered.map{ String(format: "%0\(self.minimumCodePointWidth)x", $0.unicodeScalars.first!.value) }.joined(separator: self.separator)
        }
        
        guard let image = UIImage(named: name) else { return nil }
        
        let attachment = EmojicaAttachment()
        attachment.image = image
        attachment.resize(to: self.pointSize, with: self.font)
        
        // Adding characters to attachment if revertible.
        if self.revertible { attachment.characters = emoji.characters }
        
        return NSAttributedString(attachment: attachment)
    }
    
    /// Used as fallback if `replacement(for:)` returned `nil`.
    /// - parameter emoji:      The `EmojiHandler` instance containing the sequence.
    /// - returns:              An `NSAttributedString` with the fallback.
    private func fallback(for emoji: EmojiHandler) -> NSAttributedString {
        let fallback = NSMutableAttributedString()
        
        // Store for sequence.
        var sequence: [Character] = []
        
        // Loop in reverse to catch invisible symbols.
        for character in emoji.characters.reversed() {
            
            // Insert into first position of sequence.
            sequence.insert(character, at: 0)
            
            // Continue if character is invisible symbol.
            if character.hasZeroWidthJoiner || character.hasVariationSelector16 { continue }
            
            let name = String(format: "%0\(self.minimumCodePointWidth)x", character.unicodeScalars.first!.value)
            
            if let image = UIImage(named: name) {
                
                let attachment = EmojicaAttachment()
                attachment.image = image
                attachment.resize(to: self.pointSize, with: self.font)
                
                // Adding characters to attachment if revertible.
                if self.revertible { attachment.characters = sequence }
                
                fallback.insert(NSAttributedString(attachment: attachment), at: 0)
            } else {
                // Insert the character itself, along with special characters.
                fallback.insert(NSAttributedString(string: String(sequence)), at: 0)
            }
            
            sequence = []
        }
        
        return fallback
    }
}

extension Emojica {
    
    /// Reverts an attributedString converted by Emojica to a string with standard emoji.
    /// - note:                         The instance must have `revertible` set to `true`.
    /// - parameter attributedString:   The attributed string to convert back to normal.
    public func revert(attributedString: NSAttributedString) -> String {
        let storage = NSTextStorage(attributedString: attributedString)
        let range = NSRange(location: 0, length: storage.length)
        
        // Return the string as is if the instance isn't revertible.
        guard self.revertible else { return storage.string }
        
        storage.enumerateAttribute(NSAttachmentAttributeName, in: range, options: []) { (value, range, _) -> Void in
            if let attachment = value as? EmojicaAttachment {
                if let representation = attachment.representation {
                    storage.replaceCharacters(in: range, with: representation)
                }
            }
        }
        
        return storage.string
    }
}

extension Emojica {
    
    /// Replaces the emoji while editing the text view.
    /// - parameter textView:   The text view containing the changes.
    public func textViewDidChange(_ textView: UITextView) {
        let offset = textView.getCursor() ?? 0
        textView.emojicaText = self.convert(string: textView.emojicaText)
        textView.setCursor(to: offset)
    }
    
    /// Replaces the emoji while editing the text field.
    /// - note: `UITextFieldDelegate` does not offer this method by default. It's up
    ///         to the developer to implement this using the appropriate notification
    ///         provided in the documentation: `UITextFieldTextDidChange`.
    /// - parameter textField:  The text field containing the changes.
    public func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.emojicaText else { return }
        let offset = textField.getCursor() ?? 0
        textField.emojicaText = self.convert(string: text)
        textField.setCursor(to: offset)
    }
}

/// Subclass of `NSTextAttachment` for storing the original characters in the attachment.
class EmojicaAttachment: NSTextAttachment {
    /// The character store.
    var characters: [Character]?
    
    /// A string representation of the characters.
    var representation: String? {
        guard let characters = self.characters else { return nil }
        return String(characters)
    }
}
