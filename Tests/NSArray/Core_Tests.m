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
        specify(^{
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
        specify(^{
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
        specify(^{
            [[theValue([@[] isNotEmpty]) should] beNo];

            [[theValue(([@[@1, @2, @3] isNotEmpty])) should] beYes];
        });
    });

    describe(@"-[NSArray anyObject]", ^{
        specify(^{
            [[[@[] anyObject] should] beNil];
        });

        specify(^{
            [[[@[ @(1) ] anyObject] should] equal:@(1)];
        });

        specify(^{
            NSArray *array = @[ @(1), @(2)];
            [[theValue([array containsObject:@(1)] || [array containsObject:@(2)]) should] beYes];
        });
    });
});

describe(@"NSMutableArray/Core", ^{
    describe(@"-[NSMutableArray shuffle", ^{
        specify(^{
            NSMutableArray *originalArray = [NSMutableArray array];

            for (int i = 0; i < 100; i++) {
                [originalArray addObject:[NSNumber numberWithInt:i]];
            }

            NSMutableArray *shuffledArray = [originalArray mutableCopy];
            [shuffledArray shuffle];

            [[[NSSet setWithArray:originalArray] should] equal:[NSSet setWithArray:shuffledArray]];
        });
    });
});

SPEC_END
