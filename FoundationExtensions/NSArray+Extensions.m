//
//  NSArray+Extensions.m
//  aaah
//
//  Created by Stanislaw Pankevich on 2/24/13.
//  Copyright (c) 2013 IProjecting. All rights reserved.
//

#import "NSArray+Extensions.h"

@implementation NSArray (Extensions)

- (id)firstObject {
    return self.count > 0 ? [self objectAtIndex:0] : nil;
}

- (NSUInteger)lastIndex {
    return self.count > 0 ? (self.count - 1) : NSNotFound;
}

- (BOOL)isEmpty {    
    return self.count == 0;
}

- (NSArray *)map:(id(^)(id element))block {
    __block NSArray *mapArray = [NSArray array];

    [self enumerateObjectsUsingBlock:^(id element, NSUInteger idx, BOOL *stop) {
        id modifiedElement = block(element);
        
        mapArray = [mapArray arrayByAddingObject:modifiedElement];
    }];

    return mapArray;
}

@end
