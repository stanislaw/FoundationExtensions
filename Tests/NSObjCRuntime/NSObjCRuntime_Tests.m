#import "TestHelpers.h"

#import "NSObjCRuntime.h"
#import "NSURLError.h"

typedef enum {
    OPTIONS_TYPE_NONE = 0,

    OPTIONS_TYPE_ONE   =  1 << 0,
    OPTIONS_TYPE_TWO   =  1 << 1,
    OPTIONS_TYPE_THREE =  1 << 2,

    OPTIONS_TYPE_FOUR  =  1 << 3,
    OPTIONS_TYPE_FIVE  =  1 << 4,
    OPTIONS_TYPE_SIX   =  1 << 5
} OPTIONS_TYPE;

NSStringFromMethodForEnumType(kCFRunLoopRunReturnValue,
                              int,

                              kCFRunLoopRunFinished,
                              kCFRunLoopRunStopped,
                              kCFRunLoopRunTimedOut,
                              kCFRunLoopRunHandledSource);

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

SPEC_BEGIN(NSObjCRuntime_Specs)

describe(@"NSObjCRuntime.h", ^{
    describe(@"NSStringFromMethodForEnumType", ^{
        it(@"should create NSStringFrom... C functions", ^{
            [[(NSStringFromkCFRunLoopRunReturnValue(1000)) should] beNil];

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

    describe(@"NSStringFromMethodForOptionsType", ^{
        describe(@"OPTIONS_TYPE", ^{
            it(@"", ^{
                [[NSStringFromOPTIONS_TYPE(OPTIONS_TYPE_NONE) should] equal:@"OPTIONS_TYPE_NONE"];
                [[NSStringFromOPTIONS_TYPE(OPTIONS_TYPE_ONE) should] equal:@"OPTIONS_TYPE_ONE"];

                [[NSStringFromOPTIONS_TYPE(OPTIONS_TYPE_NONE | OPTIONS_TYPE_ONE) should] equal:@"OPTIONS_TYPE_ONE"];

                [[NSStringFromOPTIONS_TYPE(OPTIONS_TYPE_ONE | OPTIONS_TYPE_TWO) should] equal:@"OPTIONS_TYPE_ONE | OPTIONS_TYPE_TWO"];
                [[NSStringFromOPTIONS_TYPE(OPTIONS_TYPE_THREE | OPTIONS_TYPE_FOUR) should] equal:@"OPTIONS_TYPE_THREE | OPTIONS_TYPE_FOUR"];
                [[NSStringFromOPTIONS_TYPE(OPTIONS_TYPE_ONE | OPTIONS_TYPE_TWO | OPTIONS_TYPE_THREE | OPTIONS_TYPE_FOUR) should] equal:@"OPTIONS_TYPE_ONE | OPTIONS_TYPE_TWO | OPTIONS_TYPE_THREE | OPTIONS_TYPE_FOUR"];
            });
        });
    });

    describe(@"NSSTRING_NAME_CONSTANT", ^{
        it(@"should define a constant with a given NAME and value that equals to this NAME", ^{
            NSSTRING_CONSTANT(Constant);

            [[Constant should] equal:@"Constant"];
        });
    });
});

SPEC_END
