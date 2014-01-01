// FoundationExtensions
//
// FoundationExtensions/NSString/Concatenation.m
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license
//
// http://stackoverflow.com/a/9730316/598057

#import "Concatenation.h"

@implementation NSString (Concatenation)

- (NSString *)concatenateWithStrings:(NSString *)strings, ... {
    va_list args;
    va_start(args, strings);

    NSString *s;
    NSString *concatenatedString = [self stringByAppendingString:strings];

    while((s = va_arg(args, NSString *)))
        concatenatedString = [concatenatedString stringByAppendingString:s];

    va_end(args);

    return concatenatedString;
}

@end
