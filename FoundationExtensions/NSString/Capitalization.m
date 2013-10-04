// FoundationExtensions
//
// FoundationExtensions/NSString/Capitalization.m
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

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
