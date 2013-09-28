#import "TestHelpers.h"

#import "NSObjCRuntime.h"
#import "NSURLError.h"

NSStringFromMethodForEnumType(kCFRunLoopRunReturnValue,
                              int,

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
        });

        it(@"should create NSStringFrom... C functions", ^{
            [[(NSStringFromNSURLErrorCode(NSURLErrorNotConnectedToInternet)) should] equal:@("NSURLErrorNotConnectedToInternet")];
            [[(NSStringFromNSURLErrorCode(NSURLErrorNetworkConnectionLost)) should] equal:@("NSURLErrorNetworkConnectionLost")];
            // etc...
        });
    });
});

SPEC_END
