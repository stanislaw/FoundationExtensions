//
//  NSDictionary+Inverse.m
//  FoundationExtensionsApp
//
//  Created by Stanislaw Pankevich on 7/17/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

#import "Inversion.h"
#import "Flattening.h"

@implementation NSDictionary (Inversion)

+ (NSDictionary *)inversedDictionaryFromDictionary:(NSDictionary *)dictionary {
    NSMutableDictionary *newDictionary = [NSMutableDictionary dictionary];

    [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([obj isKindOfClass:[NSArray class]]) {
            [((NSArray *)obj)enumerateObjectsUsingBlock:^(id arrayElement, NSUInteger idx, BOOL *stop) {                
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
