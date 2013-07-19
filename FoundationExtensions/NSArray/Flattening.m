//
//  NSArray+Flattening.m
//  FoundationExtensionsApp
//
//  Created by Stanislaw Pankevich on 7/17/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

#import "Flattening.h"

@implementation NSArray (Flattening)

- (NSArray *)flattenedArray {
    NSMutableArray *newArray = [NSMutableArray array];

    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[NSArray class]]) {
            [newArray addObjectsFromArray:obj];
        } else {
            [newArray addObject:obj];
        }
    }];

    return newArray;
}

- (NSArray *)recursivelyFlattenedArray {
    NSMutableArray *newArray = [NSMutableArray array];

    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[NSArray class]]) {
            [newArray addObjectsFromArray:[(NSArray *)obj recursivelyFlattenedArray]];
        } else {
            [newArray addObject:obj];
        }
    }];

    return newArray;
}

@end