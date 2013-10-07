// FoundationExtensions
//
// FoundationExtensions/NSArray/Core.m
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license


#import "Core.h"

#import <stdlib.h>

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

- (id)anyObject {
    if (self.count == 0) return nil;

    NSUInteger index = arc4random_uniform((u_int32_t)self.count);
    return [self objectAtIndex:index];
}

@end
