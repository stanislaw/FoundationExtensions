#import "TestHelpers.h"
#import "NSRange.h"

@interface NSRange_Extensions_Tests : SenTestCase
@end

@implementation NSRange_Extensions_Tests

- (void)test_NSMathUnionRange {
    NSRange range1 = (NSRange){0, 0};
    NSRange range2 = (NSRange){3, 3};

    NSRange resultRange = NSMathUnionRange(range1, range2);

    STAssertEquals((int)resultRange.location, 3, nil);
    STAssertEquals((int)resultRange.length, 3, nil);
}

@end
