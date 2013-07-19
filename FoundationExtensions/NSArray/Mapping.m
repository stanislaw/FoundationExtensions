//
//  NSArray+Mapping.m
//  FoundationExtensionsApp
//
//  Created by Stanislaw Pankevich on 7/19/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

#import "Mapping.h"

@implementation NSArray (Mapping)

- (NSArray *)mapObjectsUsingBlock:(id(^)(id element, NSUInteger idx, BOOL *stop))block {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];

    [self enumerateObjectsUsingBlock:^(id element, NSUInteger idx, BOOL *stop) {
        id mappedElement = block(element, idx, stop);

        [array addObject:mappedElement];
    }];

    return array;
}

@end
