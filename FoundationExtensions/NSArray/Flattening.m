// FoundationExtensions
//
// FoundationExtensions/NSArray/Flattening.m
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

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
