// FoundationExtensions
//
// FoundationExtensions/NSOrderedSet/Core.m
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import "Core.h"

@implementation NSOrderedSet (Core)

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
