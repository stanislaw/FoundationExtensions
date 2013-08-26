#import <Foundation/Foundation.h>

static NSRange const NSRangeZero = {0, 0};

static inline NSUInteger NSRangeLastIndex(NSRange range) {
    if (range.length == 0) return NSNotFound;
    return (range.location + range.length - 1);
}

static inline NSRange NSMathUnionRange(NSRange range1, NSRange range2) {
    if (range1.length == 0) return range2;
    if (range2.length == 0) return range1;

    return NSUnionRange(range1, range2);
}
