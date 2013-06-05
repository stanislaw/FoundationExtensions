//
//  NSRange+Extensions.m
//  aaah
//
//  Created by Stanislaw Pankevich on 4/6/13.
//  Copyright (c) 2013 IProjecting. All rights reserved.
//

#import "NNSRange.h"

NSRange const NullRange = {0, 0};

NSUInteger NSRangeLastIndex(NSRange range) {
    if (range.length == 0) return NSNotFound;
    return (range.location + range.length - 1);
}

NSRange NSMathUnionRange(NSRange range1, NSRange range2) {
    if (range1.length == 0) return range2;
    if (range2.length == 0) return range1;
    return NSUnionRange(range1, range2);
}