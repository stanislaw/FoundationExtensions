#import "TestHelpers.h"

#import "NSArray.h"

@interface NSArray_Extensions : SenTestCase { }
@end

@implementation NSArray_Extensions

- (void)test_lastIndex {
    NSArray *array;

    array = @[];
    STAssertEquals(array.lastIndex, (NSUInteger)NSNotFound, nil);

    array = @[@1];
    STAssertEquals(array.lastIndex, (NSUInteger)0, nil);

    array = @[@1, @2, @3];
    STAssertEquals(array.lastIndex, (NSUInteger)2, nil);
}

- (void)test_firstObject {
    NSArray *array;

    array = @[];
    STAssertTrue(array.firstObject == nil, nil);

    array = @[@1];
    STAssertEquals(array.firstObject, @(1), nil);

    array = @[@1, @2, @3];
    STAssertEquals(array.firstObject, @(1), nil);
}

- (void)test_map {
    NSArray *array;
    NSArray *mapArray;

    array = @[@"s", @"s", @"s"];

    mapArray = [array mapObjectsUsingBlock:^id(NSString * element, NSUInteger idx, BOOL *stop) {
        return [element stringByAppendingString:@"sss"];
    }];

    for (NSString *el in mapArray) {
        STAssertTrue([el isEqualToString:@"ssss"], nil);
    }
}

@end
