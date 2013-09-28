//
//  NSObjCRuntime.h
//  FoundationExtensionsApp
//
//  Created by Stanislaw Pankevich on 9/28/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

#ifndef FoundationExtensionsApp_NSObjCRuntime_h
#define FoundationExtensionsApp_NSObjCRuntime_h

#import <Foundation/NSObjCRuntime.h>

#define NUMARGS(...)  (sizeof((int[]){0, ##__VA_ARGS__})/sizeof(int)-1)

#define CArrayIterate(arr, block) ({  \
    for(typeof(*arr) * it = arr, * end = (it + (sizeof(arr)/sizeof(*arr))); it != end; ++it) {  \
        block(it);  \
    }   \
})

#define NSStringFromMethodForEnumType(_name, _type, _components...) static inline NSString *NSStringFrom##_name(int value) {    \
    NSArray *componentsStrings = [@(#_components) componentsSeparatedByString:@", "];    \
    \
    int componentsCArray[NUMARGS(_components)] = { _components };    \
    \
    NSMutableArray *components = [NSMutableArray array];    \
    CArrayIterate(componentsCArray, ^(int *valuePointer) {    \
        [components addObject:@(*valuePointer)];    \
    });    \
    \
    NSUInteger valueIndex = [components indexOfObject:@(value)];    \
    return [componentsStrings objectAtIndex:valueIndex];    \
}

#endif
