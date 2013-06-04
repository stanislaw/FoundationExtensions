//
//  NSString+RegularExpressions.m
//  aaah
//
//  Created by Stanislaw Pankevich on 5/12/13.
//  Copyright (c) 2013 IProjecting. All rights reserved.
//

#import "NSString+RegularExpressions.h"

@implementation NSString (RegularExpressions)

- (BOOL)matches:(NSString *)regexp {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexp options:NSRegularExpressionCaseInsensitive error:nil];

    NSUInteger num = [regex numberOfMatchesInString:self options:0 range:NSMakeRange(0, self.length)];

    return num > 0;
}

@end