//
//  NSObject+Extensions.m
//  aaah
//
//  Created by Stanislaw Pankevich on 2/15/13.
//  Copyright (c) 2013 IProjecting. All rights reserved.
//

#import "NSObject+Extensions.h"

//id objectOrNil(id object) {
//    if (!object || [object isKindOfClass:[NSNull class]]) return nil;
//
//    return object;
//}

dispatch_block_t recursiveBlock(void (^block)(dispatch_block_t recurse)) {
    return ^{ block(recursiveBlock(block)); };
}

#import <objc/runtime.h>

void class_swizzleMethods(Class c, SEL orig, SEL new)
{
    Method origMethod = class_getInstanceMethod(c, orig);
    Method newMethod = class_getInstanceMethod(c, new);

    if (class_addMethod(c, orig, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))) {
        class_replaceMethod(c, new, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    }

    else
        method_exchangeImplementations(origMethod, newMethod);
}

@implementation NSObject (Extensions)

- (id)initWithBlock:(void(^)(id))block {
    self = [self init];

    if (self) {
        if (block) block(self);
    }

    return self;
}

- (id)modifyWithBlock:(void(^)(id))block {
    if (block) block(self);

    return self;
}

@end