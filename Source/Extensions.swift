//
//  ------------------------------------------------------------------------
//
//  Copyright 2017 Dan Lindholm
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
//  Extensions.swift
//

import Foundation
import UIKit

extension UITextView {
    public var emojicaText: NSAttributedString {
        get { return self.attributedText }
        set { self.attributedText = newValue }
    }
}

extension UILabel {
    public var emojicaText: NSAttributedString? {
        get { return self.attributedText }
        set { self.attributedText = newValue }
    }
}

extension UITextInput {
    
    /// Returns the cursor offset from the end of the document.
    internal func getCursor() -> Int? {
        guard let range = self.selectedTextRange else { return nil }
        return self.offset(from: self.endOfDocument, to: range.end)
    }
    
    /// Sets the cursor to the end position offset by the given argument.
    /// - parameter offset:     The value to offset the cursor with.
    internal func setCursor(to offset: Int) {
        guard let position = self.position(from: self.endOfDocument, offset: offset) else { return }
        self.selectedTextRange = self.textRange(from: position, to: position)
    }
    
}

extension String {
    internal init<S: Sequence>(unicodeScalars: S) where S.Iterator.Element == UnicodeScalar {
        var string = String()
        string.unicodeScalars.append(contentsOf: unicodeScalars)
        self = string
    }
}

extension Sequence where Iterator.Element == UnicodeScalar {
    var string: String {
        return String(String.UnicodeScalarView(self))
    }
}

extension NSTextAttachment {
    /// Resizes the attachment to work well with the font.
    internal func resize(to size: CGFloat, with font: UIFont?) {
        let font = font ?? UIFont.systemFont(ofSize: size)
        let height = font.ascender - font.descender
        let side = (size + height) / 2
        let margin = (height - side) / 2
        self.bounds = CGRect(x: 0, y: font.descender + margin, width: side, height: side).integral
    }
}

extension UnicodeScalar {
    
    var isObjectReplacementCharacter: Bool { return 0xfffc == self.value }
    var isReplacementCharacter: Bool { return 0xfffd == self.value }
    var isZeroWidthJoiner: Bool { return 0x200d == self.value }
    var isVariationSelector: Bool { return 0xfe0e...0xfe0f ~= self.value }
    var isVariationSelector15: Bool { return 0xfe0e == self.value }
    var isVariationSelector16: Bool { return 0xfe0f == self.value }
    var isRegionalIndicatorSymbol: Bool { return 0x1f1e6...0x1f1ff ~= self.value }
    var isModifierSymbol: Bool { return 0x1f3fb...0x1f3ff ~= self.value }
    var isKeycapSymbol: Bool { return 0x20e3 == self.value }
    var isKeycapBase: Bool { return Unicode.keycapBaseCharacters.contains(self.value) }
}

fileprivate typealias Block = Unicode.Block

extension UnicodeScalar {
    internal var isEmoji: Bool {
        guard
            !self.isObjectReplacementCharacter,
            !self.isReplacementCharacter
        else { return false }
        
        let codePoint = self.value
        
        switch codePoint {
        case Block.miscellaneousSymbols.range:
            let block = Block.miscellaneousSymbols
            return !block.nonEmoji.contains(codePoint)
            
        case Block.dingbats.range:
            let block = Block.dingbats
            return !block.nonEmoji.contains(codePoint)
            
        case Block.miscellaneousSymbolsAndPictographs.range:
            let block = Block.miscellaneousSymbolsAndPictographs
            return !block.nonEmoji.contains(codePoint)
            
        case Block.emoticons.range:
            return true
            
        case Block.transportAndMapSymbols.range:
            let block = Block.transportAndMapSymbols
            return !block.nonEmoji.contains(codePoint) && !block.unassigned.contains(codePoint)
            
        case Block.supplementalSymbolsAndPictographs.range:
            let block = Block.supplementalSymbolsAndPictographs
            return !block.nonEmoji.contains(codePoint) && !block.unassigned.contains(codePoint)
          
        case Block.symbolsAndPictographsExtendedA.range:
          let block = Block.transportAndMapSymbols
          return !block.unassigned.contains(codePoint)
            
        case let value where Unicode.additionalCharacters.contains(value):
            return true
            
        default:
            return false
        }
    }
}
