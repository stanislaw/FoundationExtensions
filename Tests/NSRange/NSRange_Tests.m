#import "TestHelpers.h"

#import "NSRange.h"

SPEC_BEGIN(NSRange_Spec)

describe(@"NSRange", ^{
    describe(@"NSMathUnionRange", ^{
        it(@"", ^{
            NSRange range1 = (NSRange){0, 0};
            NSRange range2 = (NSRange){3, 3};

            NSRange resultRange = NSMathUnionRange(range1, range2);

            [[theValue(resultRange.location) should] equal:@(3)];
            [[theValue(resultRange.length) should] equal:@(3)];
        });
    });

});

SPEC_END