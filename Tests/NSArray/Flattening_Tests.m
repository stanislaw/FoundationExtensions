#import "TestHelpers.h"

#import "NSArray.h"

SPEC_BEGIN(NSArray_Flattening_Spec)

describe(@"NSArray/Flattening", ^{
    describe(@"-[NSArray flattenedArray]", ^{
        it(@"", ^{
            [[[@[] flattenedArray] should] equal:@[]];
            [[[@[@1, @2, @3] flattenedArray] should] equal:@[@1, @2, @3]];
            [[[@[@1, @[@2, @3]] flattenedArray] should] equal:@[@1, @2, @3]];
            [[[@[@1, @[@[@2, @3]]] flattenedArray] should] equal:@[@1, @[@2, @3]]];
        });
    });

    describe(@"-[NSArray recursivelyFlattenedArray]", ^{
        it(@"", ^{
            [[[@[] recursivelyFlattenedArray] should] equal:@[]];
            [[[@[@1, @2, @3] recursivelyFlattenedArray] should] equal:@[@1, @2, @3]];
            [[[@[@1, @[@2, @3]] recursivelyFlattenedArray] should] equal:@[@1, @2, @3]];
            [[[@[@1, @[@[@2, @3]]] recursivelyFlattenedArray] should] equal:@[@1, @2, @3]];
        });
    });
});

SPEC_END
