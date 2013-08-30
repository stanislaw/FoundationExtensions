#import "TestHelpers.h"

#import "NSString.h"

SPEC_BEGIN(NSString_URL_Specs)

describe(@"NSString/URL", ^{
    describe(@"-[NSString dictionaryFromQueryComponents]", ^{
        it(@"should return a dictionary with query components", ^{
            NSString *queryComponentsString = @"docid=-7246927612831078230&hl=en";

            NSDictionary *queryComponents = @{
                @"docid": @[ @"-7246927612831078230" ],
                @"hl": @[ @"en" ]
            };

            [[queryComponentsString.dictionaryFromQueryComponents should] equal:queryComponents];
        });
    });
});

SPEC_END
