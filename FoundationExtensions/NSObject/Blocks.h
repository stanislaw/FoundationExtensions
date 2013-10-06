// FoundationExtensions
//
// FoundationExtensions/NSObject/Blocks.h
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import <Foundation/NSObject.h>

#import <dispatch/dispatch.h>

// http://stackoverflow.com/a/14730061/598057
dispatch_block_t recursiveBlock(void (^block)(dispatch_block_t recurse));

@interface NSObject (Blocks)

- (instancetype)initWithBlock:(void(^)(id))block;
- (instancetype)performBlockOnReceiver:(void(^)(id))block;

@end
