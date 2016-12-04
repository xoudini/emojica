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
//  Unicode.swift
//

import Foundation

/// A container for all base character code points relevant for emoji.
struct Unicode {
    
    /// The code points for additional characters not found in any of the blocks in `Unicode.Block`.
    static var additionalCharacters: [UInt32] {
        return [
            // Latin 1 Supplement
            0x00a9,     // COPYRIGHT SIGN
            0x00ae,     // REGISTERED SIGN
            
            // Basic Latin
            0x0023,     // NUMBER SIGN
            0x002a,     // ASTERISK
            0x0030,     // DIGIT ZERO
            0x0031,     // DIGIT ONE
            0x0032,     // DIGIT TWO
            0x0033,     // DIGIT THREE
            0x0034,     // DIGIT FOUR
            0x0035,     // DIGIT FIVE
            0x0036,     // DIGIT SIX
            0x0037,     // DIGIT SEVEN
            0x0038,     // DIGIT EIGHT
            0x0039,     // DIGIT NINE
            
            // General Punctuation
            0x203c,     // DOUBLE EXCLAMATION MARK
            0x2049,     // EXCLAMATION QUESTION MARK
            
            // Letterlike Symbols
            0x2122,     // TRADE MARK SIGN
            0x2139,     // INFORMATION SOURCE
            
            // Arrows
            0x2194,     // LEFT RIGHT ARROW
            0x2195,     // UP DOWN ARROW
            0x2196,     // NORTH WEST ARROW
            0x2197,     // NORTH EAST ARROW
            0x2198,     // SOUTH EAST ARROW
            0x2199,     // SOUTH WEST ARROW
            0x21a9,     // LEFTWARDS ARROW WITH HOOK
            0x21aa,     // RIGHTWARDS ARROW WITH HOOK
            
            // Miscellaneous Technical
            0x231a,     // WATCH
            0x231b,     // HOURGLASS
            0x2328,     // KEYBOARD
            0x23cf,     // EJECT SYMBOL
            0x23e9,     //
            0x23ea,     //
            0x23eb,     //
            0x23ec,     //
            0x23ed,     // BLACK RIGHT-POINTING DOUBLE TRIANGLE WITH VERTICAL BAR
            0x23ee,     // BLACK LEFT-POINTING DOUBLE TRIANGLE WITH VERTICAL BAR
            0x23ef,     // BLACK RIGHT-POINTING TRIANGLE WITH DOUBLE VERTICAL BAR
            0x23f0,     //
            0x23f1,     // STOPWATCH
            0x23f2,     // TIMER CLOCK
            0x23f3,     //
            0x23f8,     // DOUBLE VERTICAL BAR
            0x23f9,     // BLACK SQUARE FOR STOP
            0x23fa,     // BLACK CIRCLE FOR RECORD
            
            // Enclosed Alphanumerics
            0x24c2,     // CIRCLED LATIN CAPITAL LETTER M
            
            // Geometric Shapes
            0x25aa,     // BLACK SMALL SQUARE
            0x25ab,     // WHITE SMALL SQUARE
            0x25b6,     // BLACK RIGHT-POINTING TRIANGLE
            0x25c0,     // BLACK LEFT-POINTING TRIANGLE
            0x25fb,     // WHITE MEDIUM SQUARE
            0x25fc,     // BLACK MEDIUM SQUARE
            0x25fd,     // WHITE MEDIUM SMALL SQUARE
            0x25fe,     // BLACK MEDIUM SMALL SQUARE
            
            // Supplemental Arrows B
            0x2934,     // ARROW POINTING RIGHTWARDS THEN CURVING UPWARDS
            0x2935,     // ARROW POINTING RIGHTWARDS THEN CURVING UPWARDS
            
            // Miscellaneous Symbols And Arrows
            0x2b05,     // LEFTWARDS BLACK ARROW
            0x2b06,     // UPWARDS BLACK ARROW
            0x2b07,     // DOWNWARDS BLACK ARROW
            0x2b1b,     // BLACK LARGE SQUARE
            0x2b1c,     // WHITE LARGE SQUARE
            0x2b50,     // WHITE MEDIUM STAR
            0x2b55,     // HEAVY LARGE CIRCLE
            
            // CJK Symbols And Punctuation
            0x3030,     // WAVY DASH
            0x303d,     // PART ALTERNATION MARK
            
            // Enclosed CJK Letters And Months
            0x3297,     // CIRCLED IDEOGRAPH CONGRATULATION
            0x3299,     // CIRCLED IDEOGRAPH SECRET
            
            // Mahjong Tiles
            0x1f004,    // MAHJONG TILE RED DRAGON
            
            // Playing Cards
            0x1f0cf,    //
            
            // Enclosed Alphanumeric Supplement
            0x1f170,    // NEGATIVE SQUARED LATIN CAPITAL LETTER A
            0x1f171,    // NEGATIVE SQUARED LATIN CAPITAL LETTER B
            0x1f17e,    // NEGATIVE SQUARED LATIN CAPITAL LETTER O
            0x1f17f,    // NEGATIVE SQUARED LATIN CAPITAL LETTER P
            0x1f18e,    //
            0x1f191,    //
            0x1f192,    //
            0x1f193,    //
            0x1f194,    //
            0x1f195,    //
            0x1f196,    //
            0x1f197,    //
            0x1f198,    //
            0x1f199,    //
            0x1f19a,    //
            0x1f1e6,    // REGIONAL INDICATOR SYMBOL LETTER A
            0x1f1e7,    // REGIONAL INDICATOR SYMBOL LETTER B
            0x1f1e8,    // REGIONAL INDICATOR SYMBOL LETTER C
            0x1f1e9,    // REGIONAL INDICATOR SYMBOL LETTER D
            0x1f1ea,    // REGIONAL INDICATOR SYMBOL LETTER E
            0x1f1eb,    // REGIONAL INDICATOR SYMBOL LETTER F
            0x1f1ec,    // REGIONAL INDICATOR SYMBOL LETTER G
            0x1f1ed,    // REGIONAL INDICATOR SYMBOL LETTER H
            0x1f1ee,    // REGIONAL INDICATOR SYMBOL LETTER I
            0x1f1ef,    // REGIONAL INDICATOR SYMBOL LETTER J
            0x1f1f0,    // REGIONAL INDICATOR SYMBOL LETTER K
            0x1f1f1,    // REGIONAL INDICATOR SYMBOL LETTER L
            0x1f1f2,    // REGIONAL INDICATOR SYMBOL LETTER M
            0x1f1f3,    // REGIONAL INDICATOR SYMBOL LETTER N
            0x1f1f4,    // REGIONAL INDICATOR SYMBOL LETTER O
            0x1f1f5,    // REGIONAL INDICATOR SYMBOL LETTER P
            0x1f1f6,    // REGIONAL INDICATOR SYMBOL LETTER Q
            0x1f1f7,    // REGIONAL INDICATOR SYMBOL LETTER R
            0x1f1f8,    // REGIONAL INDICATOR SYMBOL LETTER S
            0x1f1f9,    // REGIONAL INDICATOR SYMBOL LETTER T
            0x1f1fa,    // REGIONAL INDICATOR SYMBOL LETTER U
            0x1f1fb,    // REGIONAL INDICATOR SYMBOL LETTER V
            0x1f1fc,    // REGIONAL INDICATOR SYMBOL LETTER W
            0x1f1fd,    // REGIONAL INDICATOR SYMBOL LETTER X
            0x1f1fe,    // REGIONAL INDICATOR SYMBOL LETTER Y
            0x1f1ff,    // REGIONAL INDICATOR SYMBOL LETTER Z
            
            // Enclosed Ideographic Supplement
            0x1f201,    //
            0x1f202,    // SQUARED KATAKANA SA
            0x1f21a,    // SQUARED CJK UNIFIED IDEOGRAPH-7121
            0x1f22f,    // SQUARED CJK UNIFIED IDEOGRAPH-6307
            0x1f232,    //
            0x1f233,    //
            0x1f234,    //
            0x1f235,    //
            0x1f236,    //
            0x1f237,    // SQUARED CJK UNIFIED IDEOGRAPH-6708
            0x1f238,    //
            0x1f239,    //
            0x1f23a,    //
            0x1f250,    //
            0x1f251     //
        ]
    }
    
    /// The code points of keycap base characters.
    static var keycapBaseCharacters: [UInt32] {
        return [
            0x0023,     // NUMBER SIGN
            0x002a,     // ASTERISK
            0x0030,     // DIGIT ZERO
            0x0031,     // DIGIT ONE
            0x0032,     // DIGIT TWO
            0x0033,     // DIGIT THREE
            0x0034,     // DIGIT FOUR
            0x0035,     // DIGIT FIVE
            0x0036,     // DIGIT SIX
            0x0037,     // DIGIT SEVEN
            0x0038,     // DIGIT EIGHT
            0x0039      // DIGIT NINE
        ]
    }
    
    @available(*, unavailable)
    static var standardizedVariants: [UInt32] {
        return [
            /*
            
            // Miscellaneous Symbols - 79 characters.
            0x2600,     // BLACK SUN WITH RAYS
            0x2601,     // CLOUD
            0x2602,     // UMBRELLA
            0x2603,     // SNOWMAN
            0x2604,     // COMET
            0x260e,     // BLACK TELEPHONE
            0x2611,     // BALLOT BOX WITH CHECK
            0x2614,     // UMBRELLA WITH RAIN DROPS
            0x2615,     // HOT BEVERAGE
            0x2618,     // SHAMROCK
            0x261d,     // WHITE UP POINTING INDEX
            0x2620,     //
            0x2622,     //
            0x2623,     //
            0x2626,     //
            0x262a,     //
            0x262e,     //
            0x262f,     //
            0x2638,     //
            0x2639,     //
            0x263a,     //
            0x2640,     // FEMALE SIGN
            0x2642,     // MALE SIGN
            0x2648,     //
            0x2649,     //
            0x264a,     //
            0x264b,     //
            0x264c,     //
            0x264d,     //
            0x264e,     //
            0x264f,     //
            0x2650,     //
            0x2651,     //
            0x2652,     //
            0x2653,     //
            0x2660,     //
            0x2663,     //
            0x2665,     //
            0x2666,     //
            0x2668,     //
            0x267b,     //
            0x267f,     //
            0x2692,     //
            0x2693,     //
            0x2694,     //
            0x2695,     // STAFF OF AESCULAPIUS
            0x2696,     //
            0x2697,     //
            0x2699,     //
            0x269b,     //
            0x269c,     //
            0x26a0,     //
            0x26a1,     //
            0x26aa,     //
            0x26ab,     //
            0x26b0,     //
            0x26b1,     //
            0x26bd,     //
            0x26be,     //
            0x26c4,     //
            0x26c5,     //
            0x26c8,     //
            0x26cf,     //
            0x26d1,     //
            0x26d3,     //
            0x26d4,     //
            0x26e9,     //
            0x26ea,     //
            0x26f0,     //
            0x26f1,     //
            0x26f2,     //
            0x26f3,     //
            0x26f4,     //
            0x26f5,     //
            0x26f7,     //
            0x26f8,     //
            0x26f9,     //
            0x26fa,     //
            0x26fd,     //
            
            // Dingbats - 19 characters.
            0x2702,     //
            0x2708,     //
            0x2709,     //
            0x270c,     //
            0x270d,     //
            0x270f,     //
            0x2712,     //
            0x2714,     //
            0x2716,     //
            0x271d,     //
            0x2721,     //
            0x2733,     //
            0x2734,     //
            0x2744,     //
            0x2747,     //
            0x2757,     //
            0x2763,     //
            0x2764,     //
            0x27a1,     //
            
            // Miscellaneous Symbols And Pictographs - 78 characters.
            
            
            // Emoticons - 0 characters.
            
            // Transport And Map Symbols - 13 characters.
            
            
            // Supplemental Symbols And Pictographs - 0 characters.
            
            // Additional characters - ?
            
            */
        ]
    }
    
    /// The code points of the base characters for modifier sequences.
    @available(*, unavailable)
    static var modifierBaseCharacters: [UInt32] {
        return [
            /*
            
            // Miscellaneous Symbols — (Pointing hand symbols)
            0x261d,     // UP POINTING INDEX
            
            // Miscellaneous Symbols — (Map symbol from ARIB STD B24)
            0x26f9,     // PERSON WITH BALL
            
            // Dingbats — (Miscellaneous)
            0x270a,     // RAISED FIST
            0x270b,     // RAISED HAND
            0x270c,     // VICTORY HAND
            0x270d,     // WRITING HAND
            
            // Miscellaneous Symbols And Pictographs — (Celebration symbols)
            0x1f385,    // FATHER CHRISTMAS
            
            // Miscellaneous Symbols And Pictographs — (Sport symbols)
            0x1f3c2,    // SNOWBOARDER
            0x1f3c3,    // RUNNER
            0x1f3c4,    // SURFER
            
            0x1f3c7,    // HORSE RACING
            
            0x1f3ca,    // SWIMMER
            0x1f3cb,    // WEIGHT LIFTER
            0x1f3cc,    // GOLFER
            
            // Miscellaneous Symbols And Pictographs — (Facial parts symbols)
            0x1f442,    // EAR
            0x1f443,    // NOSE
            
            // Miscellaneous Symbols And Pictographs — (Hand symbols)
            0x1f446,    // UP POINTING BACKHAND INDEX
            0x1f447,    // DOWN POINTING BACKHAND INDEX
            0x1f448,    // LEFT POINTING BACKHAND INDEX
            0x1f449,    // RIGHT POINTING BACKHAND INDEX
            0x1f44a,    // FISTED HAND SIGN
            0x1f44b,    // WAVING HAND SIGN
            0x1f44c,    // OK HAND SIGN
            0x1f44d,    // THUMBS UP SIGN
            0x1f44e,    // THUMBS DOWN SIGN
            0x1f44f,    // CLAPPING HANDS SIGN
            0x1f450,    // OPEN HANDS SIGN
            
            // Miscellaneous Symbols And Pictographs — (Portrait and role symbols)
            0x1f466,    // BOY
            0x1f467,    // GIRL
            0x1f468,    // MAN
            0x1f469,    // WOMAN
            0x1f46a,    // FAMILY (unofficial)
            0x1f46b,    // MAN AND WOMAN HOLDING HANDS (unofficial)
            0x1f46c,    // TWO MEN HOLDING HANDS (unofficial)
            0x1f46d,    // TWO WOMEN HOLDING HANDS (unofficial)
            0x1f46e,    // POLICE OFFICER
            0x1f46f,    // WOMAN WITH BUNNY EARS (unofficial)
            0x1f470,    // BRIDE WITH VEIL
            0x1f471,    // PERSON WITH BLOND HAIR
            0x1f472,    // MAN WITH GUA PI MAO
            0x1f473,    // MAN WITH TURBAN
            0x1f474,    // OLDER MAN
            0x1f475,    // OLDER WOMAN
            0x1f476,    // BABY
            0x1f477,    // CONSTRUCTION WORKER
            
            // Miscellaneous Symbols And Pictographs — (Fairy tale symbols)
            0x1f478,    // PRINCESS
            
            0x1f47c,    // BABY ANGEL
            
            // Miscellaneous Symbols And Pictographs — (Role symbol)
            0x1f481,    // INFORMATION DESK PERSON
            0x1f482,    // GUARDSMAN
            0x1f483,    // DANCER
            
            // Miscellaneous Symbols And Pictographs — (Personal care symbols)
            0x1f485,    // NAIL POLISH
            0x1f486,    // FACE MASSAGE
            0x1f487,    // HAIRCUT
            
            // Miscellaneous Symbols And Pictographs — (Comic style symbols)
            0x1f4aa,    // FLEXED BICEPS
            
            // Miscellaneous Symbols And Pictographs — (Miscellaneous mark)
            0x1f574,    // MAN IN BUSINESS SUIT LEVITATING
            0x1f575,    // SLEUTH OR SPY
            
            // Miscellaneous Symbols And Pictographs — (Role symbol) [cont.]
            0x1f57a,    // MAN DANCING
            
            // Miscellaneous Symbols And Pictographs — (Hand symbols) [cont.]
            0x1f590,    // RAISED HAND WITH FINGERS SPLAYED
            
            0x1f595,    // REVERSED HAND WITH MIDDLE FINGER EXTENDED
            0x1f596,    // RAISED HAND WITH PART BETWEEN MIDDLE AND RING FINGERS
            
            // Emoticons — (Gesture symbols)
            0x1f645,    // FACE WITH NO GOOD GESTURE
            0x1f646,    // FACE WITH OK GESTURE
            0x1f647,    // PERSON BOWING DEEPLY
            
            0x1f64b,    // HAPPY PERSON RAISING ONE HAND
            0x1f64c,    // PERSON RAISING BOTH HANDS IN CELEBRATION
            0x1f64d,    // PERSON FROWNING
            0x1f64e,    // PERSON WITH POUTING FACE
            0x1f64f,    // PERSON WITH FOLDED HANDS
            
            // Transport And Map Symbols — (Vehicles)
            0x1f6a3,    // ROWBOAT
            
            // Transport And Map Symbols — (Signage and other symbols)
            0x1f6b4,    // BICYCLIST
            0x1f6b5,    // MOUNTAIN BICYCLIST
            0x1f6b6,    // PEDESTRIAN
            
            0x1f6c0,    // BATH
            
            // Transport And Map Symbols — (Accommodation symbol)
            0x1f6cc,    // SLEEPING ACCOMMODATION
            
            // Supplemental Symbols And Pictographs — (Hand symbols)
            0x1f918,    // SIGN OF THE HORNS
            0x1f919,    // CALL ME HAND
            0x1f91a,    // RAISED BACK OF HAND
            0x1f91b,    // LEFT-FACING FIST
            0x1f91c,    // RIGHT-FACING FIST
            0x1f91d,    // HANDSHAKE (unofficial)
            0x1f91e,    // HAND WITH INDEX AND MIDDLE FINGERS CROSSED
            
            // Supplemental Symbols And Pictographs — (Emoticon faces)
            0x1f926,    // FACE PALM
            
            // Supplemental Symbols And Pictographs — (Portrait and role symbols)
            0x1f930,    // PREGNANT WOMAN
            
            0x1f933,    // SELFIE
            0x1f934,    // PRINCE
            0x1f935,    // MAN IN TUXEDO
            0x1f936,    // MOTHER CHRISTMAS
            0x1f937,    // SHRUG
            0x1f938,    // PERSON DOING CARTWHEEL
            0x1f939,    // JUGGLING
            
            0x1f93c,    // WRESTLERS (unofficial)
            0x1f93d,    // WATER POLO
            0x1f93e     // HANDBALL
            
            */
        ]
    }
}

extension Unicode {
    /// Enumerator for the six main blocks used for emoji.
    enum Block {
        /// Miscellaneous Symbols
        case miscellaneousSymbols
        /// Dingbats
        case dingbats
        /// Miscellaneous Symbols And Pictographs
        case miscellaneousSymbolsAndPictographs
        /// Emoticons
        case emoticons
        /// Transport And Map Symbols
        case transportAndMapSymbols
        /// Supplemental Symbols And Pictographs
        case supplementalSymbolsAndPictographs
    }
}

extension Unicode.Block {
    
    /// The range of the code points in the current block.
    var range: CountableClosedRange<UInt32> {
        switch self {
        case .miscellaneousSymbols:
            return 0x2600...0x26ff
        case .dingbats:
            return 0x2700...0x27bf
        case .miscellaneousSymbolsAndPictographs:
            return 0x1f300...0x1f5ff
        case .emoticons:
            return 0x1f600...0x1f64f
        case .transportAndMapSymbols:
            return 0x1f680...0x1f6ff
        case .supplementalSymbolsAndPictographs:
            return 0x1f900...0x1f9ff
        }
    }
    
    /// The code points of unassigned characters in the current block, as an array of `UInt32` values.
    ///
    /// The return values in this computed property are array literals for a few reasons:
    ///  1. The values are constant, and the Unicode® Standard is amended infrequently (roughly once a year).
    ///  2. This property is accessed quite often.
    ///  3. Flattening an array of ranges would increase complexity – see `flatMap(_:)`.
    var unassigned: [UInt32] {
        switch self {
        case .miscellaneousSymbols,
             .dingbats,
             .miscellaneousSymbolsAndPictographs,
             .emoticons:
            // These blocks don't contain any unassigned characters.
            return []
            
        case .transportAndMapSymbols:
            return [
                0x1f6d3,
                0x1f6d4,
                0x1f6d5,
                0x1f6d6,
                0x1f6d7,
                0x1f6d8,
                0x1f6d9,
                0x1f6da,
                0x1f6db,
                0x1f6dc,
                0x1f6dd,
                0x1f6de,
                0x1f6df,
                0x1f6ed,
                0x1f6ee,
                0x1f6ef,
                0x1f6f7,
                0x1f6f8,
                0x1f6f9,
                0x1f6fa,
                0x1f6fb,
                0x1f6fc,
                0x1f6fd,
                0x1f6fe,
                0x1f6ff
            ]
        case .supplementalSymbolsAndPictographs:
            return [
                0x1f900,
                0x1f901,
                0x1f902,
                0x1f903,
                0x1f904,
                0x1f905,
                0x1f906,
                0x1f907,
                0x1f908,
                0x1f909,
                0x1f90a,
                0x1f90b,
                0x1f90c,
                0x1f90d,
                0x1f90e,
                0x1f90f,
                0x1f91f,
                0x1f928,
                0x1f929,
                0x1f92a,
                0x1f92b,
                0x1f92c,
                0x1f92d,
                0x1f92e,
                0x1f92f,
                0x1f931,
                0x1f932,
                0x1f93f,
                0x1f94c,
                0x1f94d,
                0x1f94e,
                0x1f94f,
                0x1f95f,
                0x1f960,
                0x1f961,
                0x1f962,
                0x1f963,
                0x1f964,
                0x1f965,
                0x1f966,
                0x1f967,
                0x1f968,
                0x1f969,
                0x1f96a,
                0x1f96b,
                0x1f96c,
                0x1f96d,
                0x1f96e,
                0x1f96f,
                0x1f970,
                0x1f971,
                0x1f972,
                0x1f973,
                0x1f974,
                0x1f975,
                0x1f976,
                0x1f977,
                0x1f978,
                0x1f979,
                0x1f97a,
                0x1f97b,
                0x1f97c,
                0x1f97d,
                0x1f97e,
                0x1f97f,
                0x1f992,
                0x1f993,
                0x1f994,
                0x1f995,
                0x1f996,
                0x1f997,
                0x1f998,
                0x1f999,
                0x1f99a,
                0x1f99b,
                0x1f99c,
                0x1f99d,
                0x1f99e,
                0x1f99f,
                0x1f9a0,
                0x1f9a1,
                0x1f9a2,
                0x1f9a3,
                0x1f9a4,
                0x1f9a5,
                0x1f9a6,
                0x1f9a7,
                0x1f9a8,
                0x1f9a9,
                0x1f9aa,
                0x1f9ab,
                0x1f9ac,
                0x1f9ad,
                0x1f9ae,
                0x1f9af,
                0x1f9b0,
                0x1f9b1,
                0x1f9b2,
                0x1f9b3,
                0x1f9b4,
                0x1f9b5,
                0x1f9b6,
                0x1f9b7,
                0x1f9b8,
                0x1f9b9,
                0x1f9ba,
                0x1f9bb,
                0x1f9bc,
                0x1f9bd,
                0x1f9be,
                0x1f9bf,
                0x1f9c1,
                0x1f9c2,
                0x1f9c3,
                0x1f9c4,
                0x1f9c5,
                0x1f9c6,
                0x1f9c7,
                0x1f9c8,
                0x1f9c9,
                0x1f9ca,
                0x1f9cb,
                0x1f9cc,
                0x1f9cd,
                0x1f9ce,
                0x1f9cf,
                0x1f9d0,
                0x1f9d1,
                0x1f9d2,
                0x1f9d3,
                0x1f9d4,
                0x1f9d5,
                0x1f9d6,
                0x1f9d7,
                0x1f9d8,
                0x1f9d9,
                0x1f9da,
                0x1f9db,
                0x1f9dc,
                0x1f9dd,
                0x1f9de,
                0x1f9df,
                0x1f9e0,
                0x1f9e1,
                0x1f9e2,
                0x1f9e3,
                0x1f9e4,
                0x1f9e5,
                0x1f9e6,
                0x1f9e7,
                0x1f9e8,
                0x1f9e9,
                0x1f9ea,
                0x1f9eb,
                0x1f9ec,
                0x1f9ed,
                0x1f9ee,
                0x1f9ef,
                0x1f9f0,
                0x1f9f1,
                0x1f9f2,
                0x1f9f3,
                0x1f9f4,
                0x1f9f5,
                0x1f9f6,
                0x1f9f7,
                0x1f9f8,
                0x1f9f9,
                0x1f9fa,
                0x1f9fb,
                0x1f9fc,
                0x1f9fd,
                0x1f9fe,
                0x1f9ff
            ]
        }
    }
    
    /// The code points of the characters not considered to be emoji in the current block, as an array of `UInt32` values.
    ///
    /// The return values in this computed property are array literals for a few reasons:
    ///  1. The values are constant, and the Unicode® Standard is amended infrequently (roughly once a year).
    ///  2. This property is accessed quite often.
    ///  3. Flattening an array of ranges would increase complexity – see `flatMap(_:)`.
    var nonEmoji: [UInt32] {
        switch self {
        case .emoticons:
            // These blocks don't contain any characters considered not to be emoji.
            return []
            
        case .miscellaneousSymbols:
            return [
                0x2605,
                0x2606,
                0x2607,
                0x2608,
                0x2609,
                0x260a,
                0x260b,
                0x260c,
                0x260d,
                0x260f,
                0x2610,
                0x2612,
                0x2613,
                0x2616,
                0x2617,
                0x2619,
                0x261a,
                0x261b,
                0x261c,
                0x261e,
                0x261f,
                0x2621,
                0x2624,
                0x2625,
                0x2627,
                0x2628,
                0x2629,
                0x262b,
                0x262c,
                0x262d,
                0x2630,
                0x2631,
                0x2632,
                0x2633,
                0x2634,
                0x2635,
                0x2636,
                0x2637,
                0x263b,
                0x263c,
                0x263d,
                0x263e,
                0x263f,
                // 0x2640,
                0x2641,
                // 0x2642,
                0x2643,
                0x2644,
                0x2645,
                0x2646,
                0x2647,
                0x2654,
                0x2655,
                0x2656,
                0x2657,
                0x2658,
                0x2659,
                0x265a,
                0x265b,
                0x265c,
                0x265d,
                0x265e,
                0x265f,
                0x2661,
                0x2662,
                0x2664,
                0x2667,
                0x2669,
                0x266a,
                0x266b,
                0x266c,
                0x266d,
                0x266e,
                0x266f,
                0x2670,
                0x2671,
                0x2672,
                0x2673,
                0x2674,
                0x2675,
                0x2676,
                0x2677,
                0x2678,
                0x2679,
                0x267a,
                0x267c,
                0x267d,
                0x267e,
                0x2680,
                0x2681,
                0x2682,
                0x2683,
                0x2684,
                0x2685,
                0x2686,
                0x2687,
                0x2688,
                0x2689,
                0x268a,
                0x268b,
                0x268c,
                0x268d,
                0x268e,
                0x268f,
                0x2690,
                0x2691,
                // 0x2695,
                0x2698,
                0x269a,
                0x269d,
                0x269e,
                0x269f,
                0x26a2,
                0x26a3,
                0x26a4,
                0x26a5,
                0x26a6,
                0x26a7,
                0x26a8,
                0x26a9,
                0x26ac,
                0x26ad,
                0x26ae,
                0x26af,
                0x26b2,
                0x26b3,
                0x26b4,
                0x26b5,
                0x26b6,
                0x26b7,
                0x26b8,
                0x26b9,
                0x26ba,
                0x26bb,
                0x26bc,
                0x26bf,
                0x26c0,
                0x26c1,
                0x26c2,
                0x26c3,
                0x26c6,
                0x26c7,
                0x26c9,
                0x26ca,
                0x26cb,
                0x26cc,
                0x26cd,
                0x26d0,
                0x26d2,
                0x26d5,
                0x26d6,
                0x26d7,
                0x26d8,
                0x26d9,
                0x26da,
                0x26db,
                0x26dc,
                0x26dd,
                0x26de,
                0x26df,
                0x26e0,
                0x26e1,
                0x26e2,
                0x26e3,
                0x26e4,
                0x26e5,
                0x26e6,
                0x26e7,
                0x26e8,
                0x26eb,
                0x26ec,
                0x26ed,
                0x26ee,
                0x26ef,
                0x26f6,
                0x26fb,
                0x26fc,
                0x26fe,
                0x26ff
            ]
        case .dingbats:
            return [
                0x2700,
                0x2701,
                0x2703,
                0x2704,
                0x2706,
                0x2707,
                0x270e,
                0x2710,
                0x2711,
                0x2713,
                0x2715,
                0x2717,
                0x2718,
                0x2719,
                0x271a,
                0x271b,
                0x271c,
                0x271e,
                0x271f,
                0x2720,
                0x2722,
                0x2723,
                0x2724,
                0x2725,
                0x2726,
                0x2727,
                0x2729,
                0x272a,
                0x272b,
                0x272c,
                0x272d,
                0x272e,
                0x272f,
                0x2730,
                0x2731,
                0x2732,
                0x2735,
                0x2736,
                0x2737,
                0x2738,
                0x2739,
                0x273a,
                0x273b,
                0x273c,
                0x273d,
                0x273e,
                0x273f,
                0x2740,
                0x2741,
                0x2742,
                0x2743,
                0x2745,
                0x2746,
                0x2748,
                0x2749,
                0x274a,
                0x274b,
                0x274d,
                0x274f,
                0x2750,
                0x2751,
                0x2752,
                0x2756,
                0x2758,
                0x2759,
                0x275a,
                0x275b,
                0x275c,
                0x275d,
                0x275e,
                0x275f,
                0x2760,
                0x2761,
                0x2762,
                0x2765,
                0x2766,
                0x2767,
                0x2768,
                0x2769,
                0x276a,
                0x276b,
                0x276c,
                0x276d,
                0x276e,
                0x276f,
                0x2770,
                0x2771,
                0x2772,
                0x2773,
                0x2774,
                0x2775,
                0x2776,
                0x2777,
                0x2778,
                0x2779,
                0x277a,
                0x277b,
                0x277c,
                0x277d,
                0x277e,
                0x277f,
                0x2780,
                0x2781,
                0x2782,
                0x2783,
                0x2784,
                0x2785,
                0x2786,
                0x2787,
                0x2788,
                0x2789,
                0x278a,
                0x278b,
                0x278c,
                0x278d,
                0x278e,
                0x278f,
                0x2790,
                0x2791,
                0x2792,
                0x2793,
                0x2794,
                0x2798,
                0x2799,
                0x279a,
                0x279b,
                0x279c,
                0x279d,
                0x279e,
                0x279f,
                0x27a0,
                0x27a2,
                0x27a3,
                0x27a4,
                0x27a5,
                0x27a6,
                0x27a7,
                0x27a8,
                0x27a9,
                0x27aa,
                0x27ab,
                0x27ac,
                0x27ad,
                0x27ae,
                0x27af,
                0x27b1,
                0x27b2,
                0x27b3,
                0x27b4,
                0x27b5,
                0x27b6,
                0x27b7,
                0x27b8,
                0x27b9,
                0x27ba,
                0x27bb,
                0x27bc,
                0x27bd,
                0x27be
            ]
        case .miscellaneousSymbolsAndPictographs:
            return [
                0x1f322,
                0x1f323,
                0x1f394,
                0x1f395,
                0x1f398,
                0x1f39c,
                0x1f39d,
                0x1f3f1,
                0x1f3f2,
                0x1f3f6,
                0x1f4fe,
                0x1f53e,
                0x1f53f,
                0x1f540,
                0x1f541,
                0x1f542,
                0x1f543,
                0x1f544,
                0x1f545,
                0x1f546,
                0x1f547,
                0x1f548,
                0x1f54f,
                0x1f568,
                0x1f569,
                0x1f56a,
                0x1f56b,
                0x1f56c,
                0x1f56d,
                0x1f56e,
                0x1f571,
                0x1f572,
                0x1f57b,
                0x1f57c,
                0x1f57d,
                0x1f57e,
                0x1f57f,
                0x1f580,
                0x1f581,
                0x1f582,
                0x1f583,
                0x1f584,
                0x1f585,
                0x1f586,
                0x1f588,
                0x1f589,
                0x1f58e,
                0x1f58f,
                0x1f591,
                0x1f592,
                0x1f593,
                0x1f594,
                0x1f597,
                0x1f598,
                0x1f599,
                0x1f59a,
                0x1f59b,
                0x1f59c,
                0x1f59d,
                0x1f59e,
                0x1f59f,
                0x1f5a0,
                0x1f5a1,
                0x1f5a2,
                0x1f5a3,
                0x1f5a6,
                0x1f5a7,
                0x1f5a9,
                0x1f5aa,
                0x1f5ab,
                0x1f5ac,
                0x1f5ad,
                0x1f5ae,
                0x1f5af,
                0x1f5b0,
                0x1f5b3,
                0x1f5b4,
                0x1f5b5,
                0x1f5b6,
                0x1f5b7,
                0x1f5b8,
                0x1f5b9,
                0x1f5ba,
                0x1f5bb,
                0x1f5bd,
                0x1f5be,
                0x1f5bf,
                0x1f5c0,
                0x1f5c1,
                0x1f5c5,
                0x1f5c6,
                0x1f5c7,
                0x1f5c8,
                0x1f5c9,
                0x1f5ca,
                0x1f5cb,
                0x1f5cc,
                0x1f5cd,
                0x1f5ce,
                0x1f5cf,
                0x1f5d0,
                0x1f5d4,
                0x1f5d5,
                0x1f5d6,
                0x1f5d7,
                0x1f5d8,
                0x1f5d9,
                0x1f5da,
                0x1f5db,
                0x1f5df,
                0x1f5e0,
                0x1f5e2,
                0x1f5e4,
                0x1f5e5,
                0x1f5e6,
                0x1f5e7,
                0x1f5e9,
                0x1f5ea,
                0x1f5eb,
                0x1f5ec,
                0x1f5ed,
                0x1f5ee,
                0x1f5f0,
                0x1f5f1,
                0x1f5f2,
                0x1f5f4,
                0x1f5f5,
                0x1f5f6,
                0x1f5f7,
                0x1f5f8,
                0x1f5f9
            ]
        case .transportAndMapSymbols:
            return [
                0x1f6c6,
                0x1f6c7,
                0x1f6c8,
                0x1f6c9,
                0x1f6ca,
                0x1f6e6,
                0x1f6e7,
                0x1f6e8,
                0x1f6ea,
                0x1f6f1,
                0x1f6f2
            ]
        case .supplementalSymbolsAndPictographs:
            return [
                0x1f93b,
                0x1f946
            ]
        }
    }
}


//
//   INFORMATION REGARDING THIS FILE
//
// - Version of the Unicode® Standard:      9.0
// - Date checked:                          Dec 1, 2016
//
// As of the above version there are 1088 complete base characters (singletons) that can be
// represented as emoji, and an additional 38 incomplete singletons, totaling 1126 code points.
//
// There are six blocks that are mainly used for emoji, so the ranges of these blocks are used as a
// first-level validation to check whether a character is emoji or not. These blocks and the ranges
// of their code points are:
//
//      #   Name                                    Range                   Count / Block
//      1.  Miscellaneous Symbols                   U+ 2600...U+ 26ff          80 / 256
//      2.  Dingbats                                U+ 2700...U+ 27bf          33 / 192
//      3.  Miscellaneous Symbols And Pictographs   U+1f300...U+1f5ff         637 / 768
//      4.  Emoticons                               U+1f600...U+1f64f          80 /  80
//      5.  Transport And Map Symbols               U+1f680...U+1f6ff          92 / 128
//      6.  Supplemental Symbols And Pictographs    U+1f900...U+1f9ff          80 / 256
//                                                                           ----
//                                                                           1002
//
//
// The above blocks contain 1002 emoji in total, which leaves 124 emoji outside of these ranges.
//
// Some of these blocks contain unassigned characters or characters not considered to be emoji. The
// values of these code points are listed in the appendices [1] and [2] below. The Emoticons block
// is the only one fully consisting of emoji.
//
// Of the 124 emoji characters that are not found in the above blocks, 38 are incomplete singletons
// (26 regional indicator symbols and 12 keycap base characters). The remaining 86 characters are
// found in various other blocks. All of these 124 additional characters are listed in appendix [3]
// below.
//
//
//
// [1] - Unassigned characters.
//
// 1. Miscellaneous Symbols - 0 unassigned characters.
//
// 2. Dingbats - 0 unassigned characters.
//
// 3. Miscellaneous Symbols And Pictographs - 0 unassigned characters.
//
// 4. Emoticons - 0 unassigned characters.
//
// 5. Transport And Map Symbols - 25 unassigned characters.
//    0x1f6d3...0x1f6df,
//    0x1f6ed...0x1f6ef,
//    0x1f6f7...0x1f6ff
//
// 6. Supplemental Symbols And Pictographs - 174 unassigned characters.
//    0x1f900...0x1f90f,
//    0x1f91f,
//    0x1f928...0x1f92f,
//    0x1f931...0x1f932,
//    0x1f93f,
//    0x1f94c...0x1f94f,
//    0x1f95f...0x1f97f,
//    0x1f992...0x1f9bf,
//    0x1f9c1...0x1f9ff
//
//
//
// [2] - Non-emoji characters.
//
// 1. Miscellaneous Symbols - 176 non-emoji characters.
//    0x2605...0x260d,
//    0x260f...0x2610,
//    0x2612...0x2613,
//    0x2616...0x2617,
//    0x2619...0x261c,
//    0x261e...0x261f,
//    0x2621,
//    0x2624...0x2625,
//    0x2627...0x2629,
//    0x262b...0x262d,
//    0x2630...0x2637,
//    0x263b...0x263f,
//    0x2641,
//    0x2643...0x2647,
//    0x2654...0x265f,
//    0x2661...0x2662,
//    0x2664,
//    0x2667,
//    0x2669...0x267a,
//    0x267c...0x267e,
//    0x2680...0x2691,
//    0x2698,
//    0x269a,
//    0x269d...0x269f,
//    0x26a2...0x26a9,
//    0x26ac...0x26af,
//    0x26b2...0x26bc,
//    0x26bf...0x26c3,
//    0x26c6...0x26c7,
//    0x26c9...0x26cd,
//    0x26d0,
//    0x26d2,
//    0x26d5...0x26e8,
//    0x26eb...0x26ef,
//    0x26f6,
//    0x26fb...0x26fc,
//    0x26fe...0x26ff
//
// 2. Dingbats - 159 non-emoji characters.
//    0x2700...0x2701,
//    0x2703...0x2704,
//    0x2706...0x2707,
//    0x270e,
//    0x2710...0x2711,
//    0x2713,
//    0x2715,
//    0x2717...0x271c,
//    0x271e...0x2720,
//    0x2722...0x2727,
//    0x2729...0x2732,
//    0x2735...0x2743,
//    0x2745...0x2746,
//    0x2748...0x274b,
//    0x274d,
//    0x274f...0x2752,
//    0x2756,
//    0x2758...0x2762,
//    0x2765...0x2794,
//    0x2798...0x27a0,
//    0x27a2...0x27af,
//    0x27b1...0x27be
//
// 3. Miscellaneous Symbols And Pictographs - 131 non-emoji characters.
//    0x1f322...0x1f323,
//    0x1f394...0x1f395,
//    0x1f398,
//    0x1f39c...0x1f39d,
//    0x1f3f1...0x1f3f2,
//    0x1f3f6,
//    0x1f4fe,
//    0x1f53e...0x1f548,
//    0x1f54f,
//    0x1f568...0x1f56e,
//    0x1f571...0x1f572,
//    0x1f57b...0x1f586,
//    0x1f588...0x1f589,
//    0x1f58e...0x1f58f,
//    0x1f591...0x1f594,
//    0x1f597...0x1f5a3,
//    0x1f5a6...0x1f5a7,
//    0x1f5a9...0x1f5b0,
//    0x1f5b3...0x1f5bb,
//    0x1f5bd...0x1f5c1,
//    0x1f5c5...0x1f5d0,
//    0x1f5d4...0x1f5db,
//    0x1f5df...0x1f5e0,
//    0x1f5e2,
//    0x1f5e4...0x1f5e7,
//    0x1f5e9...0x1f5ee,
//    0x1f5f0...0x1f5f2,
//    0x1f5f4...0x1f5f9
//
// 4. Emoticons - 0 non-emoji characters.
//
// 5. Transport And Map Symbols - 11 non-emoji characters.
//    0x1f6c6...0x1f6ca,
//    0x1f6e6...0x1f6e8,
//    0x1f6ea,
//    0x1f6f1...0x1f6f2
//
// 6. Supplemental Symbols And Pictographs - 2 non-emoji characters.
//    0x1f93b,
//    0x1f946
//
//
//
// [3] - Additional characters.
//
// a. Latin 1 Supplement - 2 characters.
//    0x00a9,
//    0x00ae
//
// b. Basic Latin - 12 characters.
//    0x0023,               (keycap base character)
//    0x002a,               (keycap base character)
//    0x0030...0x0039       (keycap base characters)
//
// c. General Punctuation - 2 characters.
//    0x203c,
//    0x2049
//
// d. Letterlike Symbols - 2 characters.
//    0x2122,
//    0x2139
//
// e. Arrows - 8 characters.
//    0x2194...0x2199,
//    0x21a9...0x21aa
//
// f. Miscellaneous Technical - 18 characters.
//    0x231a...0x231b,
//    0x2328,
//    0x23cf,
//    0x23e9...0x23f3,
//    0x23f8...0x23fa
//
// g. Enclosed Alphanumerics - 1 characters.
//    0x24c2
//
// h. Geometric Shapes - 8 characters.
//    0x25aa...0x25ab,
//    0x25b6,
//    0x25c0,
//    0x25fb...0x25fe
//
// i. Supplemental Arrows B - 2 characters.
//    0x2934...0x2935
//
// j. Miscellaneous Symbols And Arrows - 7 characters.
//    0x2b05...0x2b07,
//    0x2b1b...0x2b1c,
//    0x2b50,
//    0x2b55
//
// k. CJK Symbols And Punctuation - 2 characters.
//    0x3030,
//    0x303d
//
// l. Enclosed CJK Letters And Months - 2 characters.
//    0x3297,
//    0x3299
//
// m. Mahjong Tiles - 1 characters.
//    0x1f004
//
// n. Playing Cards - 1 characters.
//    0x1f0cf
//
// o. Enclosed Alphanumeric Supplement - 41 characters.
//    0x1f170...0x1f171,
//    0x1f17e...0x1f17f,
//    0x1f18e,
//    0x1f191...0x1f19a,
//    0x1f1e6...0x1f1ff     (regional indicator symbols)
//
// p. Enclosed Ideographic Supplement - 15 characters.
//    0x1f201...0x1f202,
//    0x1f21a,
//    0x1f22f,
//    0x1f232...0x1f23a,
//    0x1f250...0x1f251
//
