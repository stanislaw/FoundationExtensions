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

### <a name="Querying"></a> Querying
