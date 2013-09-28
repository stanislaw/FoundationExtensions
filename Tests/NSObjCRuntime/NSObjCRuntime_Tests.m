#import "TestHelpers.h"

#import "NSObjCRuntime.h"
#import "NSURLError.h"

NSStringFromMethodForEnumType(kCFRunLoopRunReturnValue,
                              NSUInteger,

                              kCFRunLoopRunFinished,
                              kCFRunLoopRunStopped,
                              kCFRunLoopRunTimedOut,
                              kCFRunLoopRunHandledSource);

SPEC_BEGIN(NSObjCRuntime_Specs)

describe(@"NSObjCRuntime.h", ^{
    describe(@"NSStringFromMethodForEnumType", ^{
        it(@"should create NSStringFrom... C functions", ^{
            [[(NSStringFromkCFRunLoopRunReturnValue(kCFRunLoopRunFinished)) should] equal:@("kCFRunLoopRunFinished")];
            [[(NSStringFromkCFRunLoopRunReturnValue(kCFRunLoopRunStopped)) should] equal:@("kCFRunLoopRunStopped")];
            [[(NSStringFromkCFRunLoopRunReturnValue(kCFRunLoopRunTimedOut)) should] equal:@("kCFRunLoopRunTimedOut")];
            [[(NSStringFromkCFRunLoopRunReturnValue(kCFRunLoopRunHandledSource)) should] equal:@("kCFRunLoopRunHandledSource")];

            // NSLog(@"123123 %@", NSStringFromNS)
        });
    });
});

SPEC_END
