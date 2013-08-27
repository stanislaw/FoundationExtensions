#import "TestHelpers.h"

#import "NSSet.h"

SPEC_BEGIN(NSSet_Core_Spec)

describe(@"NSSet/Core", ^{
    describe(@"-[NSOrderedSet isNotEmpty]", ^{
        it(@"", ^{
            NSSet *emptySet = [NSSet set];
            [[theValue([emptySet isNotEmpty]) should] beNo];

            NSSet *nonEmptySet = [NSSet setWithObject:@(1)];
            [[theValue([nonEmptySet isNotEmpty]) should] beYes];
        });
    });
});

SPEC_END
