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
    
    /// Setting this to `false` _used to_ strip out all modifier symbols (🏻, 🏼, 🏽, 🏾 and 🏿).
    /// - note:     This will be removed in a future version.
    @available(*, deprecated: 1.0)
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
        
        let stack = generateReplacementStack(from: attributedString)
        
        // Replacing characters in reverse order, to avoid out-of-range issues.
        while let replacement = stack.pop() {
            if let replacementString = replacementString(from: replacement) {
                result.replaceCharacters(in: replacement.range, with: replacementString)
            } else {
                result.replaceCharacters(in: replacement.range, with: fallbackString(from: replacement))
            }
        }
        
        // Fix font and size of final string.
        let resultRange = result.mutableString.range(of: result.string)
        let font = self.font ?? UIFont.systemFont(ofSize: self.pointSize)
        result.addAttribute(NSAttributedStringKey.font, value: font, range: resultRange)
        
        return result
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
        
        storage.enumerateAttribute(NSAttributedStringKey.attachment, in: range, options: []) { (value, range, _) -> Void in
            if let attachment = value as? EmojicaAttachment {
                storage.replaceCharacters(in: range, with: attachment.representation)
            }
        }
        
        return storage.string
    }
}

extension Emojica {
    
    /// Replaces the emoji properly when called from `textViewDidChange(:)`.
    /// - parameter textView:   The text view containing the changes.
    public func textViewDidChange(_ textView: UITextView) {
        let offset = textView.getCursor() ?? 0
        textView.emojicaText = self.convert(string: textView.emojicaText)
        textView.setCursor(to: offset)
    }
}

extension Emojica {
    
    /// Iterates through every unicode scalar in the string and generates a stack of
    /// replacement objects.
    /// - parameter attributedString:   The string to parse.
    fileprivate func generateReplacementStack(from attributedString: NSAttributedString) -> Stack<Replacement> {
        let replacementStack: Stack<Replacement> = Stack()
        
        var range: NSRange = NSRange(location: 0, length: 0)
        
        for character in attributedString.string {
            let unicodeScalarStack: Stack<UnicodeScalar> = Stack()
            
            for unicodeScalar in character.unicodeScalars {
                range.length += UTF16.width(unicodeScalar)
                
                if unicodeScalarStack.isEmpty {
                    
                    // Quit iterating if stack is empty and current scalar isn't emoji.
                    guard unicodeScalar.isEmoji else { break }
                    unicodeScalarStack.push(unicodeScalar)
                    
                } else {
                    
                    // Non-emoji representation requested.
                    if unicodeScalar.isVariationSelector15 {
                        unicodeScalarStack.pop()
                    }
                        
                        // Emoji representation requested.
                    else if unicodeScalar.isVariationSelector16 {
                        unicodeScalarStack.push(unicodeScalar)
                    }
                        
                        // Combining enclosing keycap.
                    else if unicodeScalar.isKeycapSymbol {
                        unicodeScalarStack.push(unicodeScalar)
                    }
                        
                        // Joiner for sequences.
                    else if unicodeScalar.isZeroWidthJoiner {
                        unicodeScalarStack.push(unicodeScalar)
                    }
                        
                        // Actual emoji.
                    else if unicodeScalar.isEmoji {
                        unicodeScalarStack.push(unicodeScalar)
                    }
                }
            }
            
            /* Cleanup time */
            
            // If head is a keycap base, make sure that the last unicode scalar is an enclosing keycap.
            if let head = unicodeScalarStack.head, head.isKeycapBase {
                if !unicodeScalarStack.top!.isKeycapSymbol { unicodeScalarStack.clear() }
            }
            
            // Push replacement object to stack if the unicode scalar stack isn't empty.
            if !unicodeScalarStack.isEmpty {
                let replacement = Replacement(character: character, unicodeScalars: unicodeScalarStack.array, range: range)
                replacementStack.push(replacement)
            }
            
            // Update range location for next character.
            range.location += range.length
            range.length = 0
        }
        
        return replacementStack
    }
    
    /// Format string used for converting a code point to a hexadecimal string.
    private var formatString: String {
        return "%0\(self.minimumCodePointWidth)x"
    }
    
    /// Generates a replacement string for a grapheme cluster.
    /// - parameter replacement:    The `Replacement` instance to use in the conversion.
    /// - returns:                  An `NSAttributedString` with the replacement as an attachment, or `nil`.
    fileprivate func replacementString(from replacement: Replacement) -> NSAttributedString? {
        var name: String {
            return replacement.unicodeScalars
                .filter { !($0.isZeroWidthJoiner || $0.isVariationSelector16) }
                .map { String(format: self.formatString, $0.value) }
                .joined(separator: self.separator)
        }
        
        guard let image = UIImage(named: name) else { return nil }
        
        let attachment = EmojicaAttachment()
        attachment.image = image
        attachment.resize(to: self.pointSize, with: self.font)
        
        if self.revertible {
            attachment.insert(unicodeScalars: replacement.unicodeScalars)
        }
        
        return NSAttributedString(attachment: attachment)
    }
    
    /// Used as fallback if `replacementString(from:)` returned `nil`.
    /// - parameter replacement:    The `Replacement` instance to use in the conversion.
    /// - returns:                  An `NSAttributedString` with the fallback.
    fileprivate func fallbackString(from replacement: Replacement) -> NSAttributedString {
        let fallback = NSMutableAttributedString()
        
        let unicodeScalarStack: Stack<UnicodeScalar> = Stack(replacement.unicodeScalars)
        let failsafeStack: Stack<UnicodeScalar> = Stack()
        
        while let unicodeScalar = unicodeScalarStack.pop() {
            
            failsafeStack.push(unicodeScalar)
            
            guard !unicodeScalar.isVariationSelector16, !unicodeScalar.isZeroWidthJoiner else { continue }
            
            let name = String(format: self.formatString, unicodeScalar.value)
            
            if let image = UIImage(named: name) {
                
                let attachment = EmojicaAttachment()
                attachment.image = image
                attachment.resize(to: self.pointSize, with: self.font)
                
                if self.revertible {
                    while let u = failsafeStack.pop() {
                        attachment.insert(unicodeScalar: u)
                    }
                }
                
                fallback.insert(NSAttributedString(attachment: attachment), at: 0)
                
            } else {
                
                // No image found, so insert unicode scalars into fallback as last resort.
                var string = String()
                
                while let u = failsafeStack.pop() {
                    string.unicodeScalars.append(u)
                }
                
                fallback.insert(NSAttributedString(string: string), at: 0)
            }
        }
        
        return fallback
    }
}
