# FDLBuilder

FDL(Firebase Dynamic Links) builder.

```swift
let builder = FDLBuilder(link: "https://example.com/top", domain: "example.page.link")
    .iOS(bundleID: "com.example.foo.ios") { params in
        params.appStoreID = "123456789"
        params.fallbackURL = "https://example.com/lp/ios"
        return params
    }
    .android(packageName: "com.example.foo.android") { params in
        params.fallbackURL = "https://example.com/lp/android"
        return params
    }
    .options({ options in
        options.pathLength = .unguessable
        return options
    })

builder.build(.long) { link, _, _ in
    print("long link:", link as Any)
}
builder.build(.short) { (link, warnings, error) in
    print("short link:", link as Any, warnings as Any, error as Any)
}
```

- Build Firebase Dynamic Links easily than using the framework as it is.
- Method-chain style

## Usage

### Basic

- Initialize builder with deeplink and domain.

```swift
let deeplink = URL(string: "https://example.com/top")!
let builder = FDLBuilder(link: deeplink, domain: "example.page.link")
```

or you can also set url as String directly if it's valid url.

```swift
let builder = FDLBuilder(link: "https://example.com/top", domain: "example.page.link")
```

- Set parameters you need.

```swift
let builder = FDLBuilder(link: "https://example.com/top", domain: "example.page.link")
    .iOS(bundleID: "com.example.foo.ios") { params in
        params.appStoreID = "123456789"
        params.fallbackURL = "https://example.com/lp/ios"
        return params
    }
    .options({ options in
        options.pathLength = .unguessable
        return options
    })
```

#### Parameters

| method                    | parameter class                               |
| ------------------------- | --------------------------------------------- |
| `iOS(bundleID:_:)`        | `DynamicLinkIOSParameters`                    |
| `appStore(_:)`            | `DynamicLinkItunesConnectAnalyticsParameters` |
| `android(packageName:_:)` | `DynamicLinkAndroidParameters`                |
| `socialMetaTag(_:)`       | `DynamicLinkSocialMetaTagParameters`          |
| `navigationInfo(_:)`      | `DynamicLinkNavigationInfoParameters`         |
| `otherPlatform(_:)`       | `DynamicLinkOtherPlatformParameters`          |
| `options(_:)`             | `DynamicLinkComponentsOptions`                |

- build link

```swift
// build long link
let longLink = builder.longLink() // Optional<URL>
print(longLink as Any)

// build short link
builder.build(.short) { url, warnings, error in
    print(url as Any)
    print(warnings as Any)
    print(error as Any)
}
```

### Advanced

If you want to change deeplink before building FDL:

```swift
let builder = FDLBuilder(link: "https://example.com/top", domain: "example.page.link")
    // set parameters you need

func issueItemLink(itemID: String, completion: @escaping (URL?) -> Void) {
    builder
        .link("https://example.com/items/\(itemID)")
        .build(.short, completion: { url, warnings, error in
            print(url as Any)
            print(warnings as Any)
            print(error as Any)
            completion(url)
        })
}
```

## Dependencies

- Firebase/DynamicLinks (above v5.0.0)

## Installation

### CocoaPods

```ruby
pod 'FDLBuilder'
```

and run `pod install`

### Manually Install

Download all `*.swift` files and put your project.

## Communication

- If you found a bug, open an issue.
- If you have a feature request, open an issue.
- If you want to contribute, submit a pull request.:muscle:

## License
**FDLBuilder** is under MIT license. See the [LICENSE](LICENSE) file for more info.