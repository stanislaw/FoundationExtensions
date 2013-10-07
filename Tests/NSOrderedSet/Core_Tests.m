#import "TestHelpers.h"

#import "NSOrderedSet.h"

SPEC_BEGIN(NSOrderedSet_Core_Spec)

describe(@"NSOrderedSet/Core", ^{
    describe(@"-[NSOrderedSet lastIndex]", ^{
        it(@"", ^{            
            NSOrderedSet *emptyOrderedSet = [NSOrderedSet orderedSet];

            [[theValue(emptyOrderedSet.lastIndex) should] equal:@(NSNotFound)];

            NSOrderedSet *nonEmptyOrderedSet = [NSOrderedSet orderedSetWithObject:@(1)];
            [[theValue(nonEmptyOrderedSet.lastIndex) should] equal:@(0)];

            NSArray *array = @[@1, @2, @3];
            nonEmptyOrderedSet = [NSOrderedSet orderedSetWithArray:array];
            [[theValue(nonEmptyOrderedSet.lastIndex) should] equal:@(2)];
        });
    });
    
    describe(@"-[NSOrderedSet isNotEmpty]", ^{
        it(@"", ^{
            NSOrderedSet *emptyOrderedSet = [NSOrderedSet orderedSet];
            [[theValue([emptyOrderedSet isNotEmpty]) should] beNo];

            NSOrderedSet *nonEmptyOrderedSet = [NSOrderedSet orderedSetWithObject:@(1)];
            [[theValue([nonEmptyOrderedSet isNotEmpty]) should] beYes];
        });
    });

    describe(@"-[NSOrderedSet count]", ^{
        it(@"", ^{
            NSOrderedSet *emptyOrderedSet = [NSOrderedSet orderedSet];
            [[theValue([emptyOrderedSet count]) should] equal:@(0)];

            NSOrderedSet *nonEmptyOrderedSet = [NSOrderedSet orderedSetWithObject:@(1)];
            [[theValue([nonEmptyOrderedSet count]) should] equal:@(1)];
        });
    });

    describe(@"-[NSOrderedSet anyObject]", ^{
        specify(^{
            NSOrderedSet *orderedSet = [NSOrderedSet orderedSet];
            [[[orderedSet anyObject] should] beNil];
        });

        specify(^{
            NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithObject:@(1)];

            [[[orderedSet anyObject] should] equal:@(1)];
        });

        specify(^{
            NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithObjects:@(1), @(2), nil];
            [[theValue([orderedSet containsObject:@(1)] || [orderedSet containsObject:@(2)]) should] beYes];
        });
    });
});

SPEC_END
