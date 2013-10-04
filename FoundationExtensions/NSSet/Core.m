// FoundationExtensions
//
// FoundationExtensions/NSSet/Core.m
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import "Core.h"

@implementation NSSet (Core)

- (BOOL)isEmpty {
    return self.count == 0;
}

- (BOOL)isNotEmpty {
    return self.count > 0;
}

@end
