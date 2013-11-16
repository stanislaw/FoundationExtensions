#import "TestHelpers.h"

#import "NSArray.h"

SPEC_BEGIN(NSArray_Mapping_Spec)

describe(@"NSArray/Mapping", ^{
    describe(@"-[NSArray mapObjectsUsingBlock:]", ^{
        it(@"should map objects set by a formula defined by block", ^{
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

        it(@"should not include add objects that are evaluated to nil", ^{
            NSArray *array;
            NSArray *mapArray;

            array = @[@"s", @"s", @"s"];

            mapArray = [array mapObjectsUsingBlock:^id(NSString * element, NSUInteger idx, BOOL *stop) {
                if (idx == 1) return nil;
                
                return [element stringByAppendingString:@"sss"];
            }];

            for (NSString *el in mapArray) {
                [[theValue([el isEqualToString:@"ssss"]) should] beYes];
            }

            [[theValue(mapArray.count) should] equal:@(2)];
        });
    });
});

SPEC_END
