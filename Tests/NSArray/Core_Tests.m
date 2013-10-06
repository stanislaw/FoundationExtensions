#import "TestHelpers.h"

#import "NSArray.h"

SPEC_BEGIN(NSArray_Core_Spec)

describe(@"NSArray/Core", ^{
    describe(@"NSArrayIsArrayAndNotEmpty", ^{
        specify(^{
            [[theValue(NSArrayIsArrayAndNotEmpty(nil)) should] beNo];
            [[theValue(NSArrayIsArrayAndNotEmpty(@[])) should] beNo];
            [[theValue(NSArrayIsArrayAndNotEmpty(@[@1])) should] beYes];
        });
    });

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

            array = @[@3, @2, @1];
            [[array.firstObject should] equal:@(3)];

            array = @[@1, @2, @3];
            [[array.firstObject should] equal:@(1)];
        });
    });

    describe(@"-[NSArray isNotEmpty]", ^{
        it(@"", ^{
            [[theValue([@[] isNotEmpty]) should] beNo];

            [[theValue(([@[@1, @2, @3] isNotEmpty])) should] beYes];
        });
    });
});

SPEC_END
