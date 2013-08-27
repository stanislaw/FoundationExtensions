#import "TestHelpers.h"

#import "NSIndexSet.h"

SPEC_BEGIN(NSIndexSet_Core_Spec)

describe(@"NSIndexSet/Core", ^{
    describe(@"-[NSIndexSet isNotEmpty]", ^{
        it(@"", ^{
            NSIndexSet *emptySet = [NSIndexSet indexSet];
            [[theValue([emptySet isNotEmpty]) should] beNo];

            NSIndexSet *nonEmptySet = [NSIndexSet indexSetWithIndex:1];
            [[theValue([nonEmptySet isNotEmpty]) should] beYes];
        });
    });
});

SPEC_END
