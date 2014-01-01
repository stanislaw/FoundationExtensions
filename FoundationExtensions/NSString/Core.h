// FoundationExtensions
//
// FoundationExtensions/NSString/Core.h
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import <Foundation/NSString.h>
#import <Foundation/NSNull.h>

extern NSString * const NON_BREAKING_SPACE_SYMBOL;

static inline BOOL NSStringIsStringAndNotEmpty(NSString *string) {
    if (string == nil || [string isKindOfClass:[NSNull class]]) return NO;

    if ([string isKindOfClass:[NSString class]] == NO) return NO;

    if ([string isKindOfClass:[NSString class]] && string.length > 0) return YES;

    return NO;
}

static inline NSString *NSAlwaysStringFromObject(id object) {
    if ([object isKindOfClass:[NSString class]]) {
        return object;
    }

    if ([object respondsToSelector:@selector(stringValue)]) {
        return [object stringValue];
    }

    return [NSString string];
}

@interface NSString (Core)

+ (id)stringWithFormat:(NSString *)format array:(NSArray *)arguments;

@property (readonly) BOOL isEmpty;

@end
