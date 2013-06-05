//
//  NSObject+MethodSwizzling.h
//  FoundationExtensionsApp
//
//  Created by Stanislaw Pankevich on 6/5/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

#import <Foundation/Foundation.h>

// http://cocoadev.com/wiki/MethodSwizzling
void class_swizzleMethods(Class c, SEL orig, SEL new);

