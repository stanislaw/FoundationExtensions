#import "TestHelpers.h"

#import "NSArray.h"

SPEC_BEGIN(NSArray_Enumeration_Spec)

describe(@"NSArray/Enumeration", ^{
    describe(@"-[NSArray enumerateObjectsUsingStrides:outerBlock:innerBlock:]", ^{
        context(@"without definition of outerBlock", ^{
            it(@"should perform regular enumeration", ^{
                NSArray *array = @[@(1), @(2), @(3)];

                __block int total = 0;

                [array enumerateObjectsUsingStrides:1 outerBlock:nil innerBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                    total++;
                }];

                [[theValue(total) should] equal:@(3)];
            });
        });

        context(@"with definition of outerBlock", ^{
            it(@"should perform regular enumeration", ^{
                NSArray *array = @[@(1), @(2), @(3)];

                __block int elementsTotal = 0;
                __block int stridesTotal = 0;

                [array enumerateObjectsUsingStrides:1 outerBlock:^(NSUInteger currentStride, NSUInteger currentStrideSize, void (^innerBlockInvocationBlock)(void)) {
                    stridesTotal++;

                    [innerBlockInvocationBlock invoke];
                } innerBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                    elementsTotal++;
                }];

                [[theValue(stridesTotal) should] equal:@(3)];
                [[theValue(elementsTotal) should] equal:@(3)];
            });
        });

        context(@"last stride has less elements", ^{
            it(@"should perform regular enumeration", ^{
                NSMutableArray *array = [NSMutableArray array];

                int N = 1325;

                for (int i = 1; i <= N; i++) {
                    [array addObject:@(i)];
                }

                __block int elementsTotal = 0;
                __block int stridesTotal = 0;

                [array enumerateObjectsUsingStrides:250 outerBlock:^(NSUInteger currentStride, NSUInteger currentStrideSize, void (^innerBlockInvocationBlock)(void)) {
                    stridesTotal++;

                    [[theValue(currentStride) should] equal:@(stridesTotal)];

                    [innerBlockInvocationBlock invoke];
                } innerBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                    elementsTotal++;
                    
                    [[theValue(idx + 1) should] equal:@(elementsTotal)];
                }];
                
                [[theValue(stridesTotal) should] equal:@(6)];
                [[theValue(elementsTotal) should] equal:@(1325)];
            });
        });
    });
    
});

SPEC_END
