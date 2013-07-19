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
});

SPEC_END
