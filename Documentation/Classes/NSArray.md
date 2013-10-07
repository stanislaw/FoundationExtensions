# FoundationExtensions/NSArray

### <a name="Core"></a> Core

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

### <a name="Flattening"></a> Flattening

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

### <a name="Mapping"></a> Mapping

###### mapObjectsUsingBlock:

`- (NSArray *)mapObjectsUsingBlock:(id(^)(id element, NSUInteger idx, BOOL *stop))block`

```objective-c
NSArray *array = @[@"s", @"s", @"s"];

NSArray *mappedArray = [array mapObjectsUsingBlock:^id(NSString * element, NSUInteger idx, BOOL *stop) {
    return [element stringByAppendingString:@"sss"];
}]; // @[ @"ssss", @"ssss", @"ssss" ]
```

### <a name="Querying"></a> Querying

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
