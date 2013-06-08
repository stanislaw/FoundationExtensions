#import "TestHelpers.h"

#import "NSArray.h"

SPEC_BEGIN(NSArray_Core_Spec)

describe(@"NSArray/Core", ^{
    describe(@"-[NSArray lastIndex]", ^{
        it(@"", ^{
            NSArray *array;

            array = @[];
            [[theValue(array.lastIndex) should] equal:@(NSNotFound)];

            array = @[@1];
            [[theValue(array.lastIndex) should] equal:@(0)];

            array = @[@1, @2, @3];
            [[theValue(array.lastIndex) should] equal:@(2)];
        });
    });

    describe(@"-[NSArray firstObject]", ^{
        it(@"", ^{
            NSArray *array;

            array = @[];
            [array.firstObject shouldBeNil];

            array = @[@1];
            [[array.firstObject should] equal:@(1)];

            array = @[@1, @2, @3];
            [[array.firstObject should] equal:@(1)];
        });
    });
});

SPEC_END
