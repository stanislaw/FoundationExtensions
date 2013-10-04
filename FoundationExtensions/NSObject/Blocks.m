// FoundationExtensions
//
// FoundationExtensions/NSObject/Blocks.m
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

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

- (instancetype)performBlockOnReceiver:(void(^)(id))block {
    if (block) block(self);

    return self;
}

@end
