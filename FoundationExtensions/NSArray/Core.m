//
//  NSArray+Extensions.m
//  aaah
//
//  Created by Stanislaw Pankevich on 2/24/13.
//  Copyright (c) 2013 IProjecting. All rights reserved.
//

#import "Core.h"

BOOL NSArrayIsArrayAndNotEmpty(id object) {
    if (object == nil || [object isKindOfClass:[NSArray class]] == NO) return NO;

    return ((NSArray *)object).isNotEmpty;
}

@implementation NSArray (Core)

- (id)firstObject {
    return self.count > 0 ? [self objectAtIndex:0] : nil;
}

- (NSUInteger)lastIndex {
    return self.count > 0 ? (self.count - 1) : NSNotFound;
}

- (BOOL)isEmpty {    
    return self.count == 0;
}

- (BOOL)isNotEmpty {
    return self.count > 0;
}

@end
