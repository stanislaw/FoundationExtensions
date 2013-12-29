# FoundationExtensions Documentation

## Contents

[Overview](#Overview)

[Classes](#Classes)

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

## <a name="Overview"></a> Overview

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

## Classes

### FoundationExtensions/NSArray

#### <a name="Core"></a> Core

###### isEmpty

```objective-c
BOOL isEmptyArrayEmpty = @[].isEmpty // YES;
BOOL isNonEmptyArrayEmpty = @[ @(1), @(2), @(3) ].isEmpty; // NO;
```

###### isNotEmpty

```objective-c
BOOL isEmptyArrayNotEmpty = @[].isNotEmpty; // NO;
BOOL isNonEmptyArrayNotEmpty = @[ @(1), @(2), @(3) ].isNotEmpty; // YES;
```

###### lastIndex

```objective-c
NSUInteger lastIndex = @[].lastIndex; // NSNotFound
NSUInteger lastIndex = @[ @(1) ].lastIndex; // 0
NSUInteger lastIndex = @[ @(1), @(2), @(3) ].lastIndex; // 2
```

###### firstObject

```objective-c
id firstObject = @[].firstObject; // nil
id firstObject = @[ @(1) ].firstObject; // @(1)
id firstObject = @[ @(3), @(2), @(1) ].firstObject; // @(3)
```

###### anyObject

`- (id)anyObject`

```objective-c
id anyObject = @[].anyObject; // nil
id anyObject = @[ @(1) ].anyObject; // @(1)
id anyObject = @[ @(3), @(2), @(1) ].anyObject; // object any of @(1), @(2) or @(3)
```

#### <a name="Flattening"></a> Flattening

###### flattenedArray

`- (NSArray *)flattenedArray`

```objective-c
NSArray *flattenedArray;
flattenedArray = [@[] flattenedArray]; // @[]
flattenedArray = [@[ @(1), @(2), @(3) ] flattenedArray]; // @[ @(1), @(2), @(3) ]
flattenedArray = [@[ @(1), @[ @(2), @(3)] ] flattenedArray]; // @[ @(1), @(2), @(3) ]
flattenedArray = [@[ @(1), @[ @[ @(2), @(3)] ] ] flattenedArray]; // @[ @(1), @[ @(2), @(3) ] ]
```

###### recursivelyFlattenedArray

`- (NSArray *)recursivelyFlattenedArray`

```objective-c
NSArray *recursivelyFlattenedArray;
recursivelyFlattenedArray = [@[] recursivelyFlattenedArray]; // @[]
recursivelyFlattenedArray = [@[ @(1), @(2), @(3) ] recursivelyFlattenedArray]; // @[ @(1), @(2), @(3) ]
recursivelyFlattenedArray = [@[ @(1), @[ @(2), @(3)] ] recursivelyFlattenedArray]; // @[ @(1), @(2), @(3) ]
recursivelyFlattenedArray = [@[ @(1), @[ @[ @(2), @(3)] ] ] recursivelyFlattenedArray]; // @[ @(1), @(2), @(3) ]
```

#### <a name="Mapping"></a> Mapping

###### mapObjectsUsingBlock:

`- (NSArray *)mapObjectsUsingBlock:(id(^)(id element, NSUInteger idx, BOOL *stop))block`

```objective-c
NSArray *array = @[@"s", @"s", @"s"];

NSArray *mappedArray = [array mapObjectsUsingBlock:^id(NSString * element, NSUInteger idx, BOOL *stop) {
    return [element stringByAppendingString:@"sss"];
}]; // @[ @"ssss", @"ssss", @"ssss" ]
```

#### <a name="Querying"></a> Querying

###### objectsPassingTest:

`- (NSArray *)objectsPassingTest:(BOOL(^)(id obj, NSUInteger idx, BOOL *stop))predicate`

```objective-c
NSArray *objectsPassingTest = [@[ @(1), @(2), @(3)] objectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
    return [obj isEqual:@(1)];
}]; // @[ @(1) ]
```

###### objectPassingTest:

`- (id)objectPassingTest:(BOOL(^)(id obj, NSUInteger idx, BOOL *stop))predicate`

```objective-c
id objectPassingTest = [@[ @(1), @(2), @(3)] objectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
    return [obj isEqual:@(1)] == NO;
}]; // @(2)
```

