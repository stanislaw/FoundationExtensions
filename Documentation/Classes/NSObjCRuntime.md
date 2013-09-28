# FoundationExtensions/NSObjCRuntime.h

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
optionsTypeString = NSStringFromOPTIONS_TYPE(OPTIONS_TYPE_ONE | OPTIONS_TYPE_TWO | OPTIONS_TYPE_THREE | OPTIONS_TYPE_FOUR); // OPTIONS_TYPE_ONE | OPTIONS_TYPE_TWO | OPTIONS_TYPE_THREE | OPTIONS_TYPE_FOUR 
```
