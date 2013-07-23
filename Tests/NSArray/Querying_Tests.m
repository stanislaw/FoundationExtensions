#import "TestHelpers.h"

#import "NSArray.h"

SPEC_BEGIN(NSArray_Querying_Spec)

describe(@"NSArray/Querying", ^{
    describe(@"-[NSArray objectsPassingTest:]", ^{
        it(@"", ^{
            NSArray *array, *filteredArray;

            array = @[@(1), @(2), @(3)];

            filteredArray = [array objectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
                return [obj isEqual:@(1)];
            }];

            [[theValue(filteredArray.count) should] equal:@(1)];
            [[filteredArray.lastObject should] equal:@(1)];
        });
    });

    describe(@"-[NSArray objectPassingTest:]", ^{
        it(@"", ^{
            NSArray *array = @[@(1), @(2), @(3)];

            [[[array objectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
                return [obj isEqual:@(1)];
            }] should] equal:@(1)];

            [[[array objectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
                return [obj isEqual:@(1)] == NO;
            }] should] equal:@(2)];

            [[[array objectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
                return [obj isEqual:@(4)];
            }] should] beNil];
        });
    });
});

SPEC_END
