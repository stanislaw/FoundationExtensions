//
//  NSArray+Enumeration.h
//  TestsApp
//
//  Created by Stanislaw Pankevich on 10/11/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Enumeration)

- (void)enumerateObjectsUsingStrides:(NSUInteger)strideSize outerBlock:(void(^)(NSUInteger currentStride, NSUInteger currentStrideSize, void(^innerBlockInvocationBlock)(void)))outerBlock innerBlock:(void(^)(id obj, NSUInteger idx, BOOL *stop))innerBlock;

@end
