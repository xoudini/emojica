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
//  EmojiHandler.swift
//

import Foundation

/// Handler for conversions.
internal class EmojiHandler {
    
    /// All copied handler instances from the string.
    private(set) var results: [EmojiHandler] = []
    
    /// The characters of the instance.
    private(set) var characters: [Character] = []
    
    /// The filtered version of `characters`.
    var filtered: [Character] {
        return self.characters.filter{ !$0.hasZeroWidthJoiner && !$0.hasVariationSelector16 }
    }
    
    /// The characters of the instance as a `String`.
    var string: String { return String(characters) }
    
    /// The type of the last element.
    private var last: ScalarType?
    
    /// Used to check whether the instance should be finished or not.
    var complete: Bool {
        guard let last = self.last else { return false }
        return last != .binding
    }
    
    /// Method for adding characters to the instance.
    /// - parameter characters:     The `Character`s to add.
    func add(characters: Character...) {
        // Set last to ScalarType of last element.
        self.last = characters.flatMap{ $0.unicodeScalars.map{ $0.type } }.last
        
        // Add character(s) to instance.
        let sequence = characters.flatMap{ $0.unicodeScalars.map{ Character($0) } }
        self.characters.append(contentsOf: sequence)
    }
    
    /// Method for wrapping up the complete emoji and adding a copy into `results`.
    func finish() {
        guard !self.characters.isEmpty else { return }
        self.results.append(self.copy)
        self.characters = []
        self.last = nil
    }
    
    // Returns a copy of the instance.
    private var copy: EmojiHandler {
        let new = EmojiHandler()
        new.characters = self.characters
        new.last = self.last
        return new
    }
}

extension EmojiHandler {
    /// Enumerator for whether the scalar is binding or not. 
    enum ScalarType {
        case standard
        case binding
    }
}
