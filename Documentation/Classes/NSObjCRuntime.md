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

