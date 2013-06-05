//
//  NSString+RegularExpressions.m
//  aaah
//
//  Created by Stanislaw Pankevich on 5/12/13.
//  Copyright (c) 2013 IProjecting. All rights reserved.
//

#import "RegularExpressions.h"

@implementation NSString (RegularExpressions)

- (BOOL)matches:(NSString *)regularExpressionString {
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:regularExpressionString options:NSRegularExpressionCaseInsensitive error:nil];

    NSUInteger num = [regularExpression numberOfMatchesInString:self options:0 range:NSMakeRange(0, self.length)];

    return num > 0;
}

@end
