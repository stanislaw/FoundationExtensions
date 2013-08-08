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
});

SPEC_END
