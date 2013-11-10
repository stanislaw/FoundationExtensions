//
//  NSArray+Enumeration.m
//  TestsApp
//
//  Created by Stanislaw Pankevich on 10/11/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

#import "Enumeration.h"

@implementation NSArray (Enumeration)

- (void)enumerateObjectsUsingStrides:(NSUInteger)strideSize outerBlock:(void(^)(NSUInteger currentStride, NSUInteger currentStrideSize, void(^innerBlockInvocationBlock)(void)))outerBlock innerBlock:(void(^)(id obj, NSUInteger idx, BOOL *stop))innerBlock {
    NSUInteger objectsCount = self.count;

    if (strideSize > objectsCount) {
        NSString *reason = @"Stride size must be less than a number of elements in an array";
        @throw [NSException exceptionWithName:NSGenericException reason:reason userInfo:nil];
    }

    NSUInteger stridesN = objectsCount / strideSize;
    NSUInteger lastStrideRemainder = objectsCount % strideSize;

    if (lastStrideRemainder > 0) {
        stridesN++;
    }

    for (int currentStride = 1; currentStride <= stridesN; currentStride++) {
        NSUInteger currentStrideSize = strideSize;

        if (currentStride == stridesN && lastStrideRemainder > 0) {
            currentStrideSize = lastStrideRemainder;
        }

        NSRange currentStrideRange = NSMakeRange((currentStride - 1) * strideSize, currentStrideSize);
        NSIndexSet *currentStrideIndexes = [NSIndexSet indexSetWithIndexesInRange:currentStrideRange];

        if (outerBlock) {
            outerBlock(currentStride, currentStrideSize, ^{
                [self enumerateObjectsAtIndexes:currentStrideIndexes options:0 usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                    innerBlock(obj, idx, stop);
                }];
            });
        } else {
            [self enumerateObjectsAtIndexes:currentStrideIndexes options:0 usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                innerBlock(obj, idx, stop);
            }];
        }
    }
}

@end
