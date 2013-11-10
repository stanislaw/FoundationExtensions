// FoundationExtensions
//
// FoundationExtensions/NSArray/Enumeration.h
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import <Foundation/Foundation.h>

@interface NSArray (Enumeration)

- (void)enumerateObjectsUsingStrides:(NSUInteger)strideSize outerBlock:(void(^)(NSUInteger currentStride, NSUInteger currentStrideSize, void(^innerBlockInvocationBlock)(void)))outerBlock innerBlock:(void(^)(id obj, NSUInteger idx, BOOL *stop))innerBlock;

@end
