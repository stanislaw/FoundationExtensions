// FoundationExtensions
//
// FoundationExtensions/NSDictionary/Inversion.m
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import "Inversion.h"
#import "../NSArray/Flattening.h"

@implementation NSDictionary (Inversion)

+ (NSDictionary *)inversedDictionaryFromDictionary:(NSDictionary *)dictionary {
    NSMutableDictionary *newDictionary = [NSMutableDictionary dictionary];

    [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL * __unused stop) {
        if ([obj isKindOfClass:[NSArray class]]) {
            [((NSArray *)obj)enumerateObjectsUsingBlock:^(id arrayElement, NSUInteger __unused idx, BOOL * __unused stop) {                
                if ([newDictionary.allKeys containsObject:arrayElement]) {
                    [newDictionary setObject:[@[ [newDictionary objectForKey:arrayElement], key] flattenedArray] forKey:arrayElement];
                } else {
                    [newDictionary setObject:key forKey:arrayElement];
                }
            }];
        } else {
            if ([newDictionary.allKeys containsObject:obj]) {
                [newDictionary setObject:[@[ [newDictionary objectForKey:obj], key] flattenedArray] forKey:obj];
            } else {
                [newDictionary setObject:key forKey:obj];
            }
        }
    }];

    return newDictionary;
}

@end
