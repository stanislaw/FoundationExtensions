#import "TestHelpers.h"

#import "NSDictionary.h"

SPEC_BEGIN(NSDictionary_Spec)

describe(@"NSDictionary/Inversion", ^{
    describe(@"-[NSDictionary inversedDictionaryFromDictionary]", ^{
        it(@"", ^{
            NSDictionary *dictionary, *inversedDictionary;
            BOOL equality;
            
            dictionary = @{ @1: @[ @3, @2, @1] };
            inversedDictionary = [NSDictionary inversedDictionaryFromDictionary:dictionary];

            equality = [inversedDictionary isEqualToDictionary:@{ @3: @1, @2: @1, @1: @1 }];
            [[theValue(equality) should] beYes];

            ////
            
            dictionary = @{ @1: @2, @3: @5, @6 : @[ @7, @8 ] };
            inversedDictionary = [NSDictionary inversedDictionaryFromDictionary:dictionary];
            
            equality = [inversedDictionary isEqualToDictionary:@{ @2: @1, @5: @3, @7: @6, @8: @6 }];
            [[theValue(equality) should] beYes];
            
            ////

            dictionary = @{ @1: @[ @3, @2, @1], @2: @[ @3, @5, @7] };
            inversedDictionary = [NSDictionary inversedDictionaryFromDictionary:dictionary];

            equality = [inversedDictionary isEqualToDictionary:@{ @3: @[@1, @2], @2: @1, @1: @1, @5: @2, @7: @2 }];
            [[theValue(equality) should] beYes];
        });
    });
});

describe(@"NSDictionary/URL", ^{
    describe(@"-[NSDictionary stringFromQueryComponents]", ^{
        it(@"should return a string from query components", ^{
            NSString *queryComponentsString = @"docid=-7246927612831078230&hl=en";
            NSDictionary *queryComponents = @{
                @"docid": @"-7246927612831078230",
                @"hl": @"en"
            };

            [[queryComponents.stringFromQueryComponents should] equal:queryComponentsString];
        });
    });
});

SPEC_END
