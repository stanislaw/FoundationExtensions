//
//  NSArray+Extensions.m
//  aaah
//
//  Created by Stanislaw Pankevich on 2/24/13.
//  Copyright (c) 2013 IProjecting. All rights reserved.
//

#import "Core.h"

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

@end
