# SwiftPlaceholderTextView

A simple UITextView. But with placeholder.

![Swift](https://img.shields.io/badge/Swift-5-orange)
![Platforms](https://img.shields.io/badge/Platforms-iOS-yellowgreen)
![Swift Package Manager](https://img.shields.io/badge/SwiftPackageManager-Compatible-brightgreen)

## Installation

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. 

Once you have your Swift package set up, add SwiftPlaceholderTextView to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/giuseppebruno/SwiftPlaceholderTextView.git", .upToNextMajor(from: "1.0.0"))
]
```

## Usage

Add a `UIView` from the Storyboard and subclass as `SwiftPlaceholderTextView` or create a `SwiftPlaceholderTextView` view programmatically.

```swift
import SwiftPlaceholderTextView

...

let spt = SwiftPlaceholderTextView()
spt.placeholder = "Insert text..."
```

#### That's it.

## Customization

You can customize the TextView as follow:

- `cornerRadius`: TextView corner radius. Default: 8
- `borderWidth`: TextView border width. Default: 1
- `borderColor`: TextView border color. Default: black
- `placeholderFont`: TextView placeholder font. Default: system font
- `placeholderTextColor`: TextView placeholder text color. Default: #CACACC
- `font`: TextView text font. Default: system font
- `textColor`: TextView text color. Default: black
- `returnKeyType`: TextView return button
- `keyboardType`: TextView keyboard type
- `returnKeyShouldDismissKeyboard`: Return key should dismiss keyboard. Default: true

## Contributing

We welcome all contributions. If you found a bug, feel free to open an issue. If you want to contribute, submit a pull request.

## Show your support 💪

1. ⭐️ Star the repo
2. 🗣 Share the repo with your friends

## Credits

SwiftPlaceholderTextView is developed by [Giuseppe Bruno](https://github.com/giuseppebruno).

## License

SwiftPlaceholderTextView is released under the MIT license. See [LICENSE](https://github.com/giuseppebruno/SwiftPlaceholderTextView/blob/master/LICENSE) for details.
