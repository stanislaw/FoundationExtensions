#import "TestHelpers.h"

#import "NSURL.h"

SPEC_BEGIN(NSURL_QueryComponents_Specs)

describe(@"NSURL/QueryComponents", ^{
    describe(@"-[NSURL queryComponents]", ^{
        it(@"should return a dictionary of query components", ^{
            NSString *URLString = @"http://video.google.co.uk:80/videoplay?docid=-7246927612831078230&hl=en#00h02m30s";
            NSURL *URL = [NSURL URLWithString:URLString];
            
            NSDictionary *queryComponents = @{
                @"docid": @[ @"-7246927612831078230" ],
                @"hl": @[ @"en" ]
            };

            [[URL.queryComponents should] equal:queryComponents];
        });
    });
});

SPEC_END
