// FoundationExtensions
//
// FoundationExtensions/NSString/RegularExpressions.m
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import "RegularExpressions.h"
#import <Foundation/NSRegularExpression.h>

@implementation NSString (RegularExpressions)

- (BOOL)matches:(NSString *)regularExpressionString {
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:regularExpressionString options:NSRegularExpressionCaseInsensitive error:nil];

    NSUInteger num = [regularExpression numberOfMatchesInString:self options:0 range:NSMakeRange(0, self.length)];

    return num > 0;
}

@end
