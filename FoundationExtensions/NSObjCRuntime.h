// FoundationExtensions
//
// FoundationExtensions/NSObjCRuntime.h
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#ifndef FoundationExtensionsApp_NSObjCRuntime_h
#define FoundationExtensionsApp_NSObjCRuntime_h

#import <Foundation/NSObjCRuntime.h>
#import <Foundation/NSString.h>

#define NSStringFromMethodForEnumType(_name, _type, _components...) static inline NSString *NSStringFrom##_name(_type value) {    \
    NSArray *componentsStrings = [@(#_components) componentsSeparatedByString:@", "];    \
    \
    int N = (sizeof((_type[]){0, _components})/sizeof(_type) - 1);    \
    _type componentsCArray[] = { _components };    \
    \
    for (int i = 0; i < N; i++) {    \
        if (componentsCArray[i] == value) return [componentsStrings objectAtIndex:i];    \
    }    \
    \
    return nil;    \
}

#define NSStringFromMethodForOptionsType(_name, _type, _options...) static inline NSString *NSStringFrom##_name(_type value) {    \
    NSArray *optionsStrings = [@(#_options) componentsSeparatedByString:@", "];    \
    NSMutableArray *optionsComponentsForValue = [NSMutableArray array];    \
    \
    int N = (sizeof((_type[]){0, _options})/sizeof(_type) - 1);    \
    _type componentsCArray[] = { _options };    \
    \
    for (int i = 0; i < N; i++) {    \
        _type option = componentsCArray[i];    \
        if ((value & option) != NO || (value == 0 && option == 0)) {    \
            NSString *optionString = [optionsStrings objectAtIndex:i];    \
            [optionsComponentsForValue addObject:optionString];    \
        }    \
    }    \
    \
    return optionsComponentsForValue.count > 0 ? [optionsComponentsForValue componentsJoinedByString:@" | "] : nil;    \
}

#define NSSTRING_CONSTANT_HEADER(name) NSString * const name
#define NSSTRING_CONSTANT(name) NSString * const name = @#name

#endif
