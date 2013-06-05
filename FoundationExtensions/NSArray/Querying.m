//
//  NSArray+Quering.m
//  FoundationExtensionsApp
//
//  Created by Stanislaw Pankevich on 6/5/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

#import "Querying.h"

@implementation NSArray (Querying)

- (NSArray *)map:(id(^)(id element))block {
    __block NSArray *mapArray = [NSArray array];

    [self enumerateObjectsUsingBlock:^(id element, NSUInteger idx, BOOL *stop) {
        id modifiedElement = block(element);

        mapArray = [mapArray arrayByAddingObject:modifiedElement];
    }];

    return mapArray;
}

@end
