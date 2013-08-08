//
//  NSString+Capitalization.m
//  FoundationExtensionsApp
//
//  Created by Stanislaw Pankevich on 8/8/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

#import "Capitalization.h"

@implementation NSString (Capitalization)

- (NSString *)stringWithFirstLetterCapitalized {
    NSString *stringWithFirstLetterCapitalized;

    if (self.length > 0) {
        stringWithFirstLetterCapitalized = [self stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[self substringToIndex:1].capitalizedString];
    }

    return stringWithFirstLetterCapitalized;
}

@end
