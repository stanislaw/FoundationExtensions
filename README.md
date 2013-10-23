# FoundationExtensions

`FoundationExtensions` is a collection of extensions for `Foundation` framework. It is a relative to another similar repository: [UIKitExtensions](https://github.com/stanislaw/UIKitExtensions). You may address the following features overview to the both of these projects as they share the same design principles.

## Quick overview

Here is a quick overview of features that set `FoundationExtensions` apart from many other similar collections on Github:

* __Modularity out of a box__ 

No umbrella packs of extensions. Import concrete pack of extensions you need in your code, not the whole pack of unnecesarry extensions or even the whole project.

Example:

```objective-c
#import <FoundationExtensions/NSURL/QueryComponents.h>
...
NSURL *URL = ...;
NSDictionary *queryComponents = [URL queryComponents];
```

* __Careful naming__ 

Encouraging Objective-C style, discouraging non-Objective-C style.
 
* __No sugar-naming__

No bringing in other programming languages style (For example, Ruby).

Example:

`FoundationExtensions/NSArray/Mapping.h` has 

```objective-c
- (NSArray *)mapObjectsUsingBlock:(id(^)(id element, NSUInteger idx, BOOL *stop))block;
```

not just `- (NSArray *)map:...` like it would if it was influenced by Ruby style i.e. its name follows naming conventions we may see established in [NSArray Class reference by Apple](https://developer.apple.com/library/ios/documentation/Cocoa/Reference/Foundation/Classes/NSArray_Class/NSArray.html).

* __Real extensions__

No aliasing sugar-methods, no methods that tend to be too much specific.

## Status 2013.10.23

The project is still in a setup phase. If you liked the idea, feel free to suggest your extensions that you use in your daily programming routine - I will be happy to merge any code that address the scope of this general purpose framework of Foundation extensions.

More documentation [is coming](https://github.com/stanislaw/FoundationExtensions/blob/master/Documentation/Index.md).

[![Build Status](https://travis-ci.org/stanislaw/FoundationExtensions.png?branch=master)](https://travis-ci.org/stanislaw/FoundationExtensions)

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

## Credits

Thanks to the following projects here on Github:

* [ObjectiveSugar](https://github.com/mneorr/ObjectiveSugar)
  * NSArray/Core: `-[NSArray anyObject]` method by @kastiglione [Taken directly from [#40](https://github.com/mneorr/ObjectiveSugar/pull/40) with renaming: `sample -> anyObject`].

## Similar tools

* [ObjectiveSugar](https://github.com/mneorr/ObjectiveSugar) 

> ObjectiveC additions for humans. Ruby style.

* [BlocksKit](https://github.com/pandamonia/BlocksKit) 

> The Objective-C block utilities you always wish you had.

* [Useful-Bits](https://github.com/kevinoneill/Useful-Bits)

> A Collection of Useful Cocoa and UIKit Bits.

## Copyright

Copyright (c) 2013, Stanislaw Pankevich. See LICENSE for details.

