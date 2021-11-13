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
//  Utility.swift
//

import Foundation
import UIKit

/// Simple, generic stack implementation.
internal class Stack<T> {
    private(set) var array: [T]
    
    init(_ array: [T] = []) {
        self.array = array
    }
    
    var isEmpty: Bool {
        return self.array.isEmpty
    }
    
    var size: Int {
        return self.array.count
    }
    
    func push(_ object: T) {
        self.array.append(object)
    }
    
    @discardableResult
    func pop() -> T? {
        guard !self.isEmpty else { return nil }
        return self.array.removeLast()
    }
    
    var head: T? {
        return self.array.first
    }
    
    var top: T? {
        return self.array.last
    }
    
    func clear() {
        self.array.removeAll()
    }
}

/// Object used in the conversion procedure as a container for a single grapheme cluster.
internal class Replacement {
    let character: Character
    let unicodeScalars: [UnicodeScalar]
    let range: NSRange
    
    init(character: Character, unicodeScalars: [UnicodeScalar], range: NSRange) {
        self.character = character
        self.unicodeScalars = unicodeScalars
        self.range = range
    }
}

/// Subclass of `NSTextAttachment` for storing the original unicode scalars in the attachment.
internal class EmojicaAttachment: NSTextAttachment {
    private var unicodeScalars: [UnicodeScalar] = []
    
    /// A string representation of the unicode scalars.
    var representation: String {
        return self.unicodeScalars.string
    }
    
    func insert(unicodeScalar: UnicodeScalar) {
        self.unicodeScalars.append(unicodeScalar)
    }
    
    func insert(unicodeScalars: [UnicodeScalar]) {
        self.unicodeScalars.append(contentsOf: unicodeScalars)
    }
}
