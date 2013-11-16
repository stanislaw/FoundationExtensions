// FoundationExtensions
//
// FoundationExtensions/NSArray/Mapping.m
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import "Mapping.h"

@implementation NSArray (Mapping)

- (NSArray *)mapObjectsUsingBlock:(id(^)(id element, NSUInteger idx, BOOL *stop))block {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];

    [self enumerateObjectsUsingBlock:^(id element, NSUInteger idx, BOOL *stop) {
        id mappedElement = block(element, idx, stop);

        if (mappedElement) {
            [array addObject:mappedElement];
        }
    }];

    return array;
}

@end
