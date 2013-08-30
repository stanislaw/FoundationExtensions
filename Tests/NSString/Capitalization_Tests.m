#import "TestHelpers.h"

#import "NSString.h"

SPEC_BEGIN(NSString_Capitalization_Specs)

describe(@"NSString/Capitalization", ^{

    describe(@"-[NSString stringWithFirstLetterCapitalized]", ^{
        it(@"", ^{
            NSString *string = @"foundationExtensions foundationExtensions foundationExtensions";
            NSString *stringWithFirstLetterCapitalized = string.stringWithFirstLetterCapitalized;

            [[stringWithFirstLetterCapitalized should] equal:@"FoundationExtensions foundationExtensions foundationExtensions"];
        });
    });
});

SPEC_END
