#import "TestHelpers.h"

#import "NSObjCRuntime.h"
#import "NSURLError.h"

typedef enum {
    TEST_OPTIONS_TYPE_NONE = 0,

    TEST_OPTIONS_TYPE_ONE = 1 << 0,
    TEST_OPTIONS_TYPE_TWO = 1 << 1,
    TEST_OPTIONS_TYPE_THREE = 1 << 2,

    TEST_OPTIONS_TYPE_FOUR = 1 << 3,
    TEST_OPTIONS_TYPE_FIVE = 1 << 4,
    TEST_OPTIONS_TYPE_SIX  = 1 << 5
} TEST_OPTIONS_TYPE;

typedef enum {
    TEST_OPTIONS_TYPE2_ONE = 1 << 0,
    TEST_OPTIONS_TYPE2_TWO = 1 << 1,
    TEST_OPTIONS_TYPE2_THREE = 1 << 2,

    TEST_OPTIONS_TYPE2_FOUR = 1 << 3,
    TEST_OPTIONS_TYPE2_FIVE = 1 << 4,
    TEST_OPTIONS_TYPE2_SIX  = 1 << 5
} TEST_OPTIONS_TYPE2;

NSStringFromMethodForEnumType(kCFRunLoopRunReturnValue,
                              int,

                              kCFRunLoopRunFinished,
                              kCFRunLoopRunStopped,
                              kCFRunLoopRunTimedOut,
                              kCFRunLoopRunHandledSource);

NSStringFromMethodForOptionsType(TEST_OPTIONS_TYPE,
                                 NSUInteger,

                                 TEST_OPTIONS_TYPE_NONE,
                                 TEST_OPTIONS_TYPE_ONE,
                                 TEST_OPTIONS_TYPE_TWO,
                                 TEST_OPTIONS_TYPE_THREE,

                                 TEST_OPTIONS_TYPE_FOUR,
                                 TEST_OPTIONS_TYPE_FIVE,
                                 TEST_OPTIONS_TYPE_SIX
                                 )

NSStringFromMethodForOptionsType(TEST_OPTIONS_TYPE2, NSUInteger,

                                 TEST_OPTIONS_TYPE2_ONE,
                                 TEST_OPTIONS_TYPE2_TWO,
                                 TEST_OPTIONS_TYPE2_THREE,

                                 TEST_OPTIONS_TYPE2_FOUR,
                                 TEST_OPTIONS_TYPE2_FIVE,
                                 TEST_OPTIONS_TYPE2_SIX)

enum {
    UIViewAnimationOptionLayoutSubviews            = 1 <<  0,
    UIViewAnimationOptionAllowUserInteraction      = 1 <<  1,
    UIViewAnimationOptionBeginFromCurrentState     = 1 <<  2,
    UIViewAnimationOptionRepeat                    = 1 <<  3,
    UIViewAnimationOptionAutoreverse               = 1 <<  4,
    UIViewAnimationOptionOverrideInheritedDuration = 1 <<  5,
    UIViewAnimationOptionOverrideInheritedCurve    = 1 <<  6,
    UIViewAnimationOptionAllowAnimatedContent      = 1 <<  7,
    UIViewAnimationOptionShowHideTransitionViews   = 1 <<  8,
    UIViewAnimationOptionOverrideInheritedOptions  = 1 <<  9,

    UIViewAnimationOptionCurveEaseInOut            = 0 << 16,
    UIViewAnimationOptionCurveEaseIn               = 1 << 16,
    UIViewAnimationOptionCurveEaseOut              = 2 << 16,
    UIViewAnimationOptionCurveLinear               = 3 << 16,

    UIViewAnimationOptionTransitionNone            = 0 << 20,
    UIViewAnimationOptionTransitionFlipFromLeft    = 1 << 20,
    UIViewAnimationOptionTransitionFlipFromRight   = 2 << 20,
    UIViewAnimationOptionTransitionCurlUp          = 3 << 20,
    UIViewAnimationOptionTransitionCurlDown        = 4 << 20,
    UIViewAnimationOptionTransitionCrossDissolve   = 5 << 20,
    UIViewAnimationOptionTransitionFlipFromTop     = 6 << 20,
    UIViewAnimationOptionTransitionFlipFromBottom  = 7 << 20,
};
typedef NSUInteger UIViewAnimationOptions;

NSStringFromMethodForOptionsType(UIViewAnimationOptions,

                                 NSUInteger,

                                 UIViewAnimationOptionLayoutSubviews,
                                 UIViewAnimationOptionAllowUserInteraction,
                                 UIViewAnimationOptionBeginFromCurrentState,
                                 UIViewAnimationOptionRepeat,
                                 UIViewAnimationOptionAutoreverse,
                                 UIViewAnimationOptionOverrideInheritedDuration,
                                 UIViewAnimationOptionOverrideInheritedCurve,
                                 UIViewAnimationOptionAllowAnimatedContent,
                                 UIViewAnimationOptionShowHideTransitionViews,
                                 UIViewAnimationOptionOverrideInheritedOptions,

                                 UIViewAnimationOptionCurveEaseInOut,
                                 UIViewAnimationOptionCurveEaseIn,
                                 UIViewAnimationOptionCurveEaseOut,
                                 UIViewAnimationOptionCurveLinear,

                                 UIViewAnimationOptionTransitionNone,
                                 UIViewAnimationOptionTransitionFlipFromLeft,
                                 UIViewAnimationOptionTransitionFlipFromRight,
                                 UIViewAnimationOptionTransitionCurlUp,
                                 UIViewAnimationOptionTransitionCurlDown,
                                 UIViewAnimationOptionTransitionCrossDissolve,
                                 UIViewAnimationOptionTransitionFlipFromTop,
                                 UIViewAnimationOptionTransitionFlipFromBottom);

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

    describe(@"NSStringFromMethodForOptionsType", ^{
        describe(@"TEST_OPTIONS_TYPE", ^{
            it(@"", ^{
                [[NSStringFromTEST_OPTIONS_TYPE(TEST_OPTIONS_TYPE_ONE) should] equal:@"TEST_OPTIONS_TYPE_ONE"];
                [[NSStringFromTEST_OPTIONS_TYPE(TEST_OPTIONS_TYPE_ONE | TEST_OPTIONS_TYPE_TWO) should] equal:@"TEST_OPTIONS_TYPE_ONE | TEST_OPTIONS_TYPE_TWO"];
                [[NSStringFromTEST_OPTIONS_TYPE(TEST_OPTIONS_TYPE_THREE | TEST_OPTIONS_TYPE_FOUR) should] equal:@"TEST_OPTIONS_TYPE_THREE | TEST_OPTIONS_TYPE_FOUR"];
            });
        });

        describe(@"TEST_OPTIONS_TYPE2", ^{
            [[NSStringFromTEST_OPTIONS_TYPE2(0) should] beNil];
            [[NSStringFromTEST_OPTIONS_TYPE2(TEST_OPTIONS_TYPE2_ONE) should] equal:@"TEST_OPTIONS_TYPE2_ONE"];
            [[NSStringFromTEST_OPTIONS_TYPE2(TEST_OPTIONS_TYPE2_ONE | TEST_OPTIONS_TYPE2_TWO | TEST_OPTIONS_TYPE2_THREE) should] equal:@"TEST_OPTIONS_TYPE2_ONE | TEST_OPTIONS_TYPE2_TWO | TEST_OPTIONS_TYPE2_THREE"];
        });

        describe(@"UIViewAnimationOption", ^{
            it(@"", ^{
                [[NSStringFromUIViewAnimationOptions(0) should] equal:@"UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionNone"];

                [[NSStringFromUIViewAnimationOptions(UIViewAnimationOptionLayoutSubviews) should] equal:@"UIViewAnimationOptionLayoutSubviews"];

                [[NSStringFromUIViewAnimationOptions(UIViewAnimationOptionCurveEaseInOut) should] equal:@"UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionNone"];
            });
        });
    });
});

SPEC_END
