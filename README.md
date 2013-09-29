# FoundationExtensions

`FoundationExtensions` is a collection of extensions for `Foundation` framework. It is a relative to another similar repository: [UIKitExtensions](https://github.com/stanislaw/UIKitExtensions). You may address the following features overview to the both of these projects as they share the same design principles.

## Quick overview

Here is a quick overview of features that set `FoundationExtensions` apart from many other similar collections on Github:

* `FoundationExtensions` borrows some well known project structure conventions from the Ruby world: it is designed completely in a modular fashion, pretty much like Ruby on Rails core framework [Active Support](https://github.com/rails/rails/tree/master/activesupport) or [Ruby facets](https://github.com/rubyworks/facets). Here are the typical import headers from the project that uses to work with `FoundationExtensions`:

```objective-c
#import <FoundationExtensions/NSObject/Blocks.h>
#import <FoundationExtensions/NSString.h>
#import <FoundationExtensions/NSArray.h>
#import <FoundationExtensions/NSRange.h>
```

This design implies the three possible ways of including `FoundationExtensions` to your project:

1) It is possible to require only `Blocks` extension for `NSObject` class:

```objective-c
#import <FoundationExtensions/NSObject/Blocks.h>
```

2) It is possible to require the whole pack of extensions for `NSObject` class:

```objective-c
#import <FoundationExtensions/NSObject.h>
```

3) And finally it is possible to include the whole `FoundationExtensions` like we do with Foundation and UIKit:

```objective-c
#import <FoundationExtensions.h>
```

* The magical power of CocoaPods [header_mappings_dir](http://docs.cocoapods.org/specification.html#header_mappings_dir) directive preserving original directory structure for header files inspires `FoundationExtensions` to break one (and only one, don't worry) Objective-C convention: it replaces the usage of `+` sign for categories with `Class/Extension` pair adhering to a corresponding folder structure. So instead of importing a category that could look like 

```objective-c
#import <FoundationExtensions/NSObject+Blocks.h>
```

you import the "extension" pack

```objective-c
#import <FoundationExtensions/NSObject/Blocks.h>
```

Just browse through the `FoundationExtensions/` folder contents - it is pretty clear, and it is cool.

## Status 2013.09.16

The project is in a setup phase. If you liked the idea, feel free to suggest your extensions that you use in your daily programming routine - I will be happy to merge any code that address the scope of this general purpose framework of Foundation extensions.

More documentation [is coming](https://github.com/stanislaw/FoundationExtensions/blob/master/Documentation/index.md).

## Installation

The recommended way is to install via Cocoapods:

Add into your Podfile:

```ruby
pod 'FoundationExtensions', :git => 'https://github.com/stanislaw/FoundationExtensions'
```

And run 

```
pod update
```

or you can just clone `FoundationExtensions` and add `FoundationExtensions/` folder to your project (though author have not performed any tests to check if the import paths like `FoundationsExtensions/NSObject/Blocks.h` would be resolved correctly without the magic power of Cocoapods).

## Similar tools

* [ObjectiveSugar](https://github.com/mneorr/ObjectiveSugar) - ObjectiveC additions for humans. Ruby style.

## Copyright

Not yet

