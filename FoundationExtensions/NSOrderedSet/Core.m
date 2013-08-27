//
//  NSOrderedSet+Core.m
//  FoundationExtensionsApp
//
//  Created by Stanislaw Pankevich on 8/8/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

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
