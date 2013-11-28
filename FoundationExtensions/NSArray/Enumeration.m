// FoundationExtensions
//
// FoundationExtensions/NSArray/Enumeration.m
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import "Enumeration.h"

@implementation NSArray (Enumeration)

- (void)enumerateObjectsUsingStrides:(NSUInteger)strideSize outerBlock:(void(^)(NSUInteger currentStride, NSUInteger currentStrideSize, void(^innerBlockInvocationBlock)(void)))outerBlock innerBlock:(void(^)(id obj, NSUInteger idx, BOOL *stop))innerBlock {
    NSUInteger objectsCount = self.count;

    if (strideSize > objectsCount) {
        NSString *reason = @"Stride size must be less than a number of elements in an array";
        @throw [NSException exceptionWithName:NSGenericException reason:reason userInfo:nil];
    }

    ldiv_t ldivResult = ldiv(objectsCount, strideSize);

    NSUInteger stridesN = ldivResult.quot;
    NSUInteger lastStrideRemainder = ldivResult.rem;

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
