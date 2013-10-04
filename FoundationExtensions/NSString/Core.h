// FoundationExtensions
//
// FoundationExtensions/NSString/Core.h
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import <Foundation/NSString.h>

extern NSString * const NON_BREAKING_SPACE_SYMBOL;

BOOL NSStringIsStringAndNotEmpty(NSString *string);

@interface NSString (Core)

+ (id)stringWithFormat:(NSString *)format array:(NSArray *)arguments;

@property (readonly) BOOL isEmpty;

@end
