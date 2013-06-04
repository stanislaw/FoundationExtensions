//
//  NSObject+Extensions.h
//  aaah
//
//  Created by Stanislaw Pankevich on 2/15/13.
//  Copyright (c) 2013 IProjecting. All rights reserved.
//

#import <Foundation/Foundation.h>

//id objectOrNil(id object);

// http://stackoverflow.com/a/14730061/598057
dispatch_block_t recursiveBlock(void (^block)(dispatch_block_t recurse));

// http://cocoadev.com/wiki/MethodSwizzling
void class_swizzleMethods(Class c, SEL orig, SEL new);

@interface NSObject (Extensions)

- (id)initWithBlock:(void(^)(id))block;
- (id)modifyWithBlock:(void(^)(id))block;

@end