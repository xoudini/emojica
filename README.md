![emojica](https://raw.githubusercontent.com/xoudini/emojica/images/emojica.png)
=====

<sup>
Emojica – a Swift framework for emoji-related matters.
</sup>

![gif](https://raw.githubusercontent.com/xoudini/emojica/images/demo.gif)

## What does it do?

Emojica allows you to replace the standard emoji in an iOS app with [custom emoji](#compatible-image-sets).

Just follow the instructions below, import your custom image set, and you're ready to go.



## Requirements

+ Xcode 8.1
+ iOS 10.0+
   *  _Lower versions haven't been tested properly, although the framework may run without issues on a lower version._



## Installation

### CocoaPods

#### 1. Add the pod to your `Podfile`:
```ruby
target '...' do
    pod 'Emojica'
end
```
#### 2. Navigate into your project directory and install/update:
```sh
$ cd /Path/To/Your/Project/ && pod install
```
 
###   Manual installation

#### 1. Clone the repository, and drag `Emojica.xcodeproj` into your project hierarchy in Xcode.
#### 2. Select your project, then select your application's target under _Targets_.
#### 3. Under the _General_ tab, click the _+_ under _Embedded Binaries_.
#### 4. Select `Emojica.frameworkiOS` and finish by pressing _Add_.

> If Xcode gives you a `No such module 'Emojica'` compiler error at your `import` statement, just 
build your application (or the framework) once. Also, each time you Clean (⇧⌘K) the project Xcode 
will give you the same error, and the solution is the same.



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

 > __NOTE__: Use this only when using a custom image set that [isn't handled by Emojica](#compatible-image-sets).

   ```swift
   emojica.minimumCodePointWidth = 4
   ```
   
 A value between 0 and 8 that sets the minimum width for code point strings in order to correctly
 find the images for the custom emoji. The character `0` is used for padding.

 To find a suitable value, find the image for e.g. © (`U+00A9 COPYRIGHT SIGN`), and use the length
 of that image's name – `a9.png` has a width of 2, `00a9.png` has a width of 4, etc.
 
 
* __Set separator__:

 > __NOTE__: Use this only when using a custom image set that [isn't handled by Emojica](#compatible-image-sets).
 
 ```swift
 emojica.separator = "~"
 ```
   
 The separator used in the image names of combined code points.
 
 
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
let sample: String = "Sample text 😎 "

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

let flag: String = "🇫🇮 "

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

> The same applies for `UITextField`, although you must yourself implement the observer for the notification
`UITextFieldTextDidChange`, since `UITextFieldDelegate` doesn't provide the method by default.



## Compatible Image Sets

> The below image sets are tested, but other image sets may work just as well. If you have an image set that
should be added to Emojica, please create an [__Issue__](https://github.com/xoudini/emojica/issues).

| Set           | Version   | Notes                               |
| ------------- | --------- | ----------------------------------- |
| [Twemoji]     | 2.2       | _[Prepare](#preparations)_          |
| [EmojiOne]    | 2.2.7     | _Missing code points_<sup>1</sup>   |
| [Noto Emoji]  | 1.05      | _[Prepare](#preparations)_          |

[Twemoji]: https://github.com/twitter/twemoji
[EmojiOne]: https://github.com/Ranks/emojione
[Noto Emoji]: https://github.com/googlei18n/noto-emoji

<sup>
1. U+2640, U+2642 and U+2695 and sequences containing these characters are unsupported.
</sup>



## Example Project

The example `EmojicaExample.xcodeproj` is set up but __does not contain images__. To test the project,
add your emoji images to the `Images` group and __Run__.



## Preparations

> __WARNING__: Running the script __will__ overwrite the image names, so __do not run the script over a unique image set!__


Some image sets may have to be slightly modified before usage. Check the table in 
[Compatible Image Sets](#compatible-image-sets) if you're using a set marked _Prepare_, and if you are,
follow these instructions:

#### 1. Copy/move the contained file `rename.sh` into the folder containing your image set.
#### 2. Open your preferred terminal.
#### 3. Navigate into the directory:
```sh
$ cd /Path/To/Your/ImageSet/
```
#### 4. Run the script:
```sh
$ sh rename.sh
```



## Contact

You can find me on Twitter at [@xoudini](https://twitter.com/xoudini), 
or send me electronic mail at [main@xoudini.com](mailto:main@xoudini.com).

Feedback and questions are welcome, create an [__Issue__](https://github.com/xoudini/emojica/issues)
for bugs, problems and feature requests.



## License

Emojica is released under the **Apache License 2.0**.
