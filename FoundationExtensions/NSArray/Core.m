// FoundationExtensions
//
// FoundationExtensions/NSArray/Core.m
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license


#import "Core.h"

BOOL NSArrayIsArrayAndNotEmpty(id object) {
    if (object == nil || [object isKindOfClass:[NSArray class]] == NO) return NO;

    return ((NSArray *)object).isNotEmpty;
}

@implementation NSArray (Core)

- (BOOL)isEmpty {
    return self.count == 0;
}

- (BOOL)isNotEmpty {
    return self.count > 0;
}

- (NSUInteger)lastIndex {
    return self.count > 0 ? (self.count - 1) : NSNotFound;
}

- (id)firstObject {
    return self.count > 0 ? [self objectAtIndex:0] : nil;
}

@end
