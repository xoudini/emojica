![emojica](https://raw.githubusercontent.com/xoudini/emojica/images/emojica.png)
=====

Emojica – a Swift framework for emoji-related matters.


## Installation

At the moment, Emojica can only be installed manually.

###   Manual installation

> This section will be expanded shortly.


## Usage

```swift
import Emojica
```

### Instantiation

```swift
let emojica = Emojica()

// Creates an instance with a font.
let emojica = Emojica(font: UIFont.systemFont(ofSize: 17.0))
```

### Configure instance

* __Set font__:

   ```swift
   emojica.font = UIFont.systemFont(ofSize: 17.0)
   ```

   If no font is set, the system font is used.
   

* __Set size__:

   ```swift
   emojica.pointSize = 17.0
   ```
   
   If you're satisfied with the default font, you can just set the size.
   The value for `pointSize` is 17.0 by default.
   
   
* __Set minimum code point width__:

   > __NOTE__: Use this only when using a custom image set that isn't handled by Emojica.

   ```swift
   emojica.minimumCodePointWidth = 4
   ```
   
   A value between 0 and 8 that sets the minimum width for code point strings in order to correctly
   find the images for the custom emoji. The character `0` is used for padding.
   
   To find a suitable value, find the image for e.g. © (`U+00A9 COPYRIGHT SIGN`), and use the length
   of that image's name – `a9.png` has a width of 2, `00a9.png` has a width of 4, etc.
   
   
* __Set image set used in the project__:

   ```swift     
   emojica.imageSet = .default
   ```
   
   Automatically configures code point width based on the image set. 
   
   
* __Disable modifier symbols__:

   ```swift
   emojica.useModifiers = false
   ```
   
   Strips out all [modifier symbols](http://unicode.org/reports/tr51/#Emoji_Modifiers_Table) from
   complete modifier sequences.
   
   
* __Enable emoji to be reverted__:

   > __NOTE__: Keep the instance non-revertible if the original strings aren't needed after conversion.

   ```swift
   emojica.revertible = true
   ```
   
   Enables strings with custom emoji to be reverted to original state.
   
   
### Convert string

```swift
let sample: String = "Sample text 😎"

let converted: NSAttributedString = emojica.convert(string: sample)
```

### Revert string

> __NOTE__: The instance must have `revertible` set to `true`.

```swift
let reverted: String = emojica.revert(attributedString: converted)
```

### Using converted strings

```swift
let textView = UITextView()

...

let flag: String = "🇫🇮"

textView.attributedText = emojica.convert(string: flag)
```

### Directly converting text input

You can directly convert text input by implementing the `UITextViewDelegate` method `textViewDidChange(_:)`
and passing the changed `UITextView` to the Emojica method by the same name:

```swift
func textViewDidChange(_ textView: UITextView) {
    emojica.textViewDidChange(textView)
}
```

The same applies for `UITextField`, although you must yourself implement the observer for the notification
`UITextFieldTextDidChange`, since `UITextFieldDelegate` doesn't provide the method by default.




## Compatible image sets

> The below image sets are tested, but other image sets may work just as well.

| Set           | Version   | Notes                   |
| ------------- | --------- | ----------------------- |
| [Twemoji]     | 2.2       | _[Prepare][1]._            |
| [EmojiOne]    | 2.2.7     | _Missing code points._  |

[Twemoji]: https://github.com/twitter/twemoji
[EmojiOne]: https://github.com/Ranks/emojione

[1]: #preparations




## Preparations

Some image sets may have to be slightly modified before usage.

> This section will be expanded shortly.




## Contact

You can find me on Twitter at [@xoudini](https://twitter.com/xoudini), 
or send me electronic mail at [main@xoudini.com](mailto:main@xoudini.com).




## License

Emojica is released under the **Apache License 2.0**.
