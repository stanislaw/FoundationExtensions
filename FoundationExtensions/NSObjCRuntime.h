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

#define NSStringFromMethodForEnumType(_name, _type, _components...) static inline NSString *NSStringFrom##_name(_type value) {    \
    NSArray *componentsStrings = [@(#_components) componentsSeparatedByString:@", "];    \
    \
    int N = (sizeof((_type[]){0, ##_components})/sizeof(_type) - 1);    \
    _type componentsCArray[] = { _components };    \
    \
    for (int i = 0; i < N; i++) {    \
        if (componentsCArray[i] == value) return [componentsStrings objectAtIndex:i];    \
    }    \
    \
    return nil;    \
}

#endif
