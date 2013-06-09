//
//  NSArray+Quering.m
//  FoundationExtensionsApp
//
//  Created by Stanislaw Pankevich on 6/5/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

#import "Querying.h"

@implementation NSArray (Querying)

- (NSArray *)mapObjectsUsingBlock:(id(^)(id element, NSUInteger idx, BOOL *stop))block {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];
    
    [self enumerateObjectsUsingBlock:^(id element, NSUInteger idx, BOOL *stop) {
        id mappedElement = block(element, idx, stop);

        [array addObject:mappedElement];
    }];

    return array;
}

- (NSArray *)objectsPassingTest:(BOOL(^)(id obj, NSUInteger idx, BOOL *stop))predicate {
    NSIndexSet *indexesOfObjectsPassingTest = [self indexesOfObjectsPassingTest:predicate];

    return [self objectsAtIndexes:indexesOfObjectsPassingTest];
}
                                       
@end
