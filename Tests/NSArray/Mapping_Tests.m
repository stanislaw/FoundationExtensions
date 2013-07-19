#import "TestHelpers.h"

#import "NSArray.h"

SPEC_BEGIN(NSArray_Mapping_Spec)

describe(@"NSArray/Mapping", ^{
    describe(@"-[NSArray mapObjectsUsingBlock:]", ^{
        it(@"", ^{
            NSArray *array;
            NSArray *mapArray;

            array = @[@"s", @"s", @"s"];

            mapArray = [array mapObjectsUsingBlock:^id(NSString * element, NSUInteger idx, BOOL *stop) {
                return [element stringByAppendingString:@"sss"];
            }];

            for (NSString *el in mapArray) {
                [[theValue([el isEqualToString:@"ssss"]) should] beYes];
            }
        });
    });
});

SPEC_END
