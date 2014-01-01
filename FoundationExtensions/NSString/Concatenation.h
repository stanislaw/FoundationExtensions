// FoundationExtensions
//
// FoundationExtensions/NSString/Concatenation.h
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import <Foundation/NSString.h>

@interface NSString (Concatenation)

- (NSString *)concatenateWithStrings:(NSString *)strings, ...;

@end
