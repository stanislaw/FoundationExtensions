//
//  NSObject+Extensions.h
//  aaah
//
//  Created by Stanislaw Pankevich on 2/15/13.
//  Copyright (c) 2013 IProjecting. All rights reserved.
//

#import <Foundation/Foundation.h>

// http://stackoverflow.com/a/14730061/598057
dispatch_block_t recursiveBlock(void (^block)(dispatch_block_t recurse));

@interface NSObject (Blocks)

- (instancetype)initWithBlock:(void(^)(id))block;
- (instancetype)performBlockOnReceiver:(void(^)(id))block;

@end
