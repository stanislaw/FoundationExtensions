//
//  NSArray+Quering.m
//  FoundationExtensionsApp
//
//  Created by Stanislaw Pankevich on 6/5/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

#import "Querying.h"

@implementation NSArray (Querying)

- (NSArray *)objectsPassingTest:(BOOL(^)(id obj, NSUInteger idx, BOOL *stop))predicate {
    NSIndexSet *indexesOfObjectsPassingTest = [self indexesOfObjectsPassingTest:predicate];

    return [self objectsAtIndexes:indexesOfObjectsPassingTest];
}

- (id)objectPassingTest:(BOOL(^)(id obj, NSUInteger idx, BOOL *stop))predicate {
    __block id object;

    NSUInteger indexOfObjectPassingTest = [self indexOfObjectPassingTest:predicate];

    if (indexOfObjectPassingTest != NSNotFound) {
        object = [self objectAtIndex:indexOfObjectPassingTest];
    }

    return object;
}

@end
