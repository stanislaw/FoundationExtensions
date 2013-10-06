#import "TestHelpers.h"

#import "NSString.h"

SPEC_BEGIN(NSString_Core_Specs)

describe(@"NSString/Core", ^{
    describe(@"NSAlwaysStringFromObject", ^{
        it(@"should return a string for a given object", ^{
            [[theValue([NSAlwaysStringFromObject(nil) isEqualToString:@""]) should] beYes];
            [[theValue([NSAlwaysStringFromObject(@("A string")) isEqualToString:@"A string"]) should] beYes];
            [[theValue([NSAlwaysStringFromObject(@(5)) isEqualToString:@"5"]) should] beYes];

            [[NSAlwaysStringFromObject([NSDictionary new]) should] equal:@""];
        });
    });
});

SPEC_END
