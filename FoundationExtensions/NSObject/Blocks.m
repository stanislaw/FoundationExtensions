//
//  NSObject+Extensions.m
//  aaah
//
//  Created by Stanislaw Pankevich on 2/15/13.
//  Copyright (c) 2013 IProjecting. All rights reserved.
//

#import "Blocks.h"

dispatch_block_t recursiveBlock(void (^block)(dispatch_block_t recurse)) {
    return ^{ block(recursiveBlock(block)); };
}

@implementation NSObject (Blocks)

- (instancetype)initWithBlock:(void(^)(id))block {
    self = [self init];

    if (self) {
        if (block) block(self);
    }

    return self;
}

- (instancetype)performBlock:(void(^)(id))block {
    if (block) block(self);

    return self;
}

@end
