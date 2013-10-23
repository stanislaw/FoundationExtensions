# FoundationExtensions Documentation

## Classes

* [NSArray](Classes/NSArray.md)
    * [Core](Classes/NSArray.md#Core)
    * [Flattening](Classes/NSArray.md#Flattening)
    * [Mapping](Classes/NSArray.md#Mapping)
    * [Querying](Classes/NSArray.md#Querying)

* NSDictionary
* NSIndexSet
* [NSObjCRuntime.h](Classes/NSObjCRuntime.md)
* NSObject
* NSOrderedSet
* NSRange
* NSSet
* [NSString](Classes/NSString.md)
* NSURL
* NSURLError

## Overview

* __Modularity__ 

`FoundationExtensions` borrows some well known project structure conventions from the Ruby world: it is designed completely in a modular fashion, pretty much like Ruby on Rails core framework [Active Support](https://github.com/rails/rails/tree/master/activesupport) or [Ruby facets](https://github.com/rubyworks/facets). Here are the typical import headers from the project that uses to work with `FoundationExtensions`:

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

----

More documentation is coming...

And for a while, you might be interested in author's original thoughts about such collections of extensions (like FoundationExtensions and UIKitExtensions)
[here](https://github.com/genericspecific/CKUITools/pull/10#issuecomment-25709693).
 
