# FoundationExtensions Documentation

## Contents

[Overview](#Overview)

[Classes](#Classes)

* [NSArray](#NSArray)
  * [Core](#NSArray/Core)
  * [Flattening](#NSArray/Flattening)
  * [Mapping](#NSArray/Mapping)
  * [Querying](#NSArray/Querying)

* [NSDictionary](#NSDictionary)
  * [Inversion](#NSDictionary/Inversion)
  * [URL](#NSDictionary/URL)

* NSIndexSet
* [NSObjCRuntime](#NSObjCRuntime)
* NSObject
* NSOrderedSet
* NSRange
* NSSet
* [NSString](#NSString)
    * [Core](#NSString/Core)
    * [Capitalization](#NSString/Capitalization)
    * [Concatenation](#NSString/Concatenation)
    * [RegularExpressions](#NSString/RegularExpressions)
    * [URL](#NSString/URL)
* NSURL
* [NSURLError](#NSURLError)

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

## <a name="Classes"></a> Classes

### <a name="NSArray"></a> NSArray

#### <a name="NSArray/Core"></a> NSArray/Core

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

###### countForObject:

`- (NSUInteger)countForObject:(id)anObject`

```objective-c
NSArray *array = @[@(1), @(1), @(1), @(2), @(3)];
NSUInteger countForObject;
countForObject = [array countForObject:@(1)]; // 3
countForObject = [array countForObject:@(2)]; // 1
countForObject = [array countForObject:@("Blip!")]; // 0
```

#### <a name="NSArray/Flattening"></a> NSArray/Flattening

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

#### <a name="NSArray/Mapping"></a> NSArray/Mapping

###### mapObjectsUsingBlock:

`- (NSArray *)mapObjectsUsingBlock:(id(^)(id element, NSUInteger idx, BOOL *stop))block`

```objective-c
NSArray *array = @[@"s", @"s", @"s"];

NSArray *mappedArray = [array mapObjectsUsingBlock:^id(NSString * element, NSUInteger idx, BOOL *stop) {
    return [element stringByAppendingString:@"sss"];
}]; // @[ @"ssss", @"ssss", @"ssss" ]
```

#### <a name="NSArray/Querying"></a> NSArray/Querying

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

----

### <a name="NSDictionary"></a> NSDictionary

#### <a name="NSDictionary/Inversion"></a> NSDictionary/Inversion

###### inversedDictionaryFromDictionary:

```+ (NSDictionary *)inversedDictionaryFromDictionary:(NSDictionary *)dictionary```

```objective-c
NSDictionary *dictionary = @{ @1: @[ @3, @2, @1] };

NSDictionary *inversedDictionary = [NSDictionary inversedDictionaryFromDictionary:dictionary]; // @{ @3: @1, @2: @1, @1: @1 }
```

#### <a name="NSDictionary/URL"></a> NSDictionary/URL

...

----

### <a name="NSObjCRuntime"></a> NSObjCRuntime

###### NSStringFromMethodForEnumType

```objective-c
NSStringFromMethodForEnumType(kCFRunLoopRunReturnValue,
                              int,

                              kCFRunLoopRunFinished,
                              kCFRunLoopRunStopped,
                              kCFRunLoopRunTimedOut,
                              kCFRunLoopRunHandledSource);
                              
NSString *returnValue;
returnValue = NSStringFromkCFRunLoopRunReturnValue(kCFRunLoopRunFinished); // @("kCFRunLoopRunFinished")
returnValue = NSStringFromkCFRunLoopRunReturnValue(kCFRunLoopRunStopped); // @("kCFRunLoopRunStopped")
returnValue = NSStringFromkCFRunLoopRunReturnValue(kCFRunLoopRunTimedOut); // @("kCFRunLoopRunTimedOut")
returnValue = NSStringFromkCFRunLoopRunReturnValue(kCFRunLoopRunHandledSource); // @("kCFRunLoopRunHandledSource")
```

###### NSStringFromMethodForOptionsType

```objective-c
typedef enum {
    OPTIONS_TYPE_NONE = 0,
    OPTIONS_TYPE_ONE   = 1 << 0,
    OPTIONS_TYPE_TWO   = 1 << 1,
    OPTIONS_TYPE_THREE = 1 << 2,
    OPTIONS_TYPE_FOUR  = 1 << 3,
    OPTIONS_TYPE_FIVE  = 1 << 4,
    OPTIONS_TYPE_SIX   = 1 << 5
} OPTIONS_TYPE;

NSStringFromMethodForOptionsType(OPTIONS_TYPE,
                                 NSUInteger,

                                 OPTIONS_TYPE_NONE,
                                 OPTIONS_TYPE_ONE,
                                 OPTIONS_TYPE_TWO,
                                 OPTIONS_TYPE_THREE,
                                 OPTIONS_TYPE_FOUR,
                                 OPTIONS_TYPE_FIVE,
                                 OPTIONS_TYPE_SIX
                                 )
                                 
NSString *optionsTypeString;
optionsTypeString = NSStringFromOPTIONS_TYPE(OPTIONS_TYPE_NONE); // @("OPTIONS_TYPE_NONE")
optionsTypeString = NSStringFromOPTIONS_TYPE(OPTIONS_TYPE_ONE | OPTIONS_TYPE_TWO); // @("OPTIONS_TYPE_ONE | OPTIONS_TYPE_TWO")
optionsTypeString = NSStringFromOPTIONS_TYPE(OPTIONS_TYPE_ONE | OPTIONS_TYPE_TWO | OPTIONS_TYPE_THREE | OPTIONS_TYPE_FOUR); // @("OPTIONS_TYPE_ONE | OPTIONS_TYPE_TWO | OPTIONS_TYPE_THREE | OPTIONS_TYPE_FOUR") 
```

### <a name="NSString"></a> NSString

#### <a name="NSString/Core"></a> NSString/Core

###### NSStringIsStringAndNotEmpty

`static inline BOOL NSStringIsStringAndNotEmpty(NSString *string)`

```objective-c
BOOL isObjectAStringAndNotEmpty;
isObjectAStringAndNotEmpty = NSStringIsStringAndNotEmpty(@"Non-empty string"); // YES
isObjectAStringAndNotEmpty = NSStringIsStringAndNotEmpty(@""); // NO

id object = nil;
isObjectAStringAndNotEmpty = NSStringIsStringAndNotEmpty(object); // NO
isObjectAStringAndNotEmpty = NSStringIsStringAndNotEmpty([NSNull null]); // NO
```

###### isEmpty

`- (BOOL)isEmpty`

```objective-c
BOOL isEmptyStringEmpty = @("").isEmpty; // YES
BOOL isNonEmptyStringEmpty = @("Non-empty string").isEmpty; // NO
```

#### <a name="NSString/Capitalization"></a> NSString/Capitalization

###### stringWithFirstLetterCapitalized

`- (NSString *)stringWithFirstLetterCapitalized`

#### <a name="NSString/Concatenation"></a> Concatenation

###### concat

`- (NSString *)concat:(NSString *)strings, ...`

#### <a name="NSString/RegularExpressions"></a> NSString/RegularExpressions

### <a name="NSString/URL"></a> NSString/URL

----

### <a name="NSURLError"></a> NSURLError

###### NSStringFromNSURLError

`static inline NSString *NSStringFromNSURLError(NSError *error)`

```objective-c
NSError *error = [NSError errorWithDomain:NSURLErrorDomain code:NSURLErrorTimedOut userInfo:nil];

NSString *stringFromError = NSStringFromNSURLError(error); // @("NSURLErrorTimedOut")
```


 

