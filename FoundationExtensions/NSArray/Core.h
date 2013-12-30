// FoundationExtensions
//
// FoundationExtensions/NSArray/Core.h
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import <Foundation/NSArray.h>

@interface NSArray (Core)

- (id)firstObject;
@property (readonly) NSUInteger lastIndex;

@property (readonly) BOOL isEmpty;
@property (readonly) BOOL isNotEmpty;

- (id)anyObject;

- (NSUInteger)countForObject:(id)anObject;

@end

@interface NSMutableArray (Core)
- (void)shuffle;
@end

static inline BOOL NSArrayIsArrayAndNotEmpty(id object) {
    if (object == nil || [object isKindOfClass:[NSArray class]] == NO) return NO;

    return ((NSArray *)object).isNotEmpty;
}


