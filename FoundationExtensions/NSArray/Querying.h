//
//  NSArray+Quering.h
//  FoundationExtensionsApp
//
//  Created by Stanislaw Pankevich on 6/5/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Querying)

- (NSArray *)objectsPassingTest:(BOOL(^)(id obj, NSUInteger idx, BOOL *stop))predicate;
- (id)objectPassingTest:(BOOL(^)(id obj, NSUInteger idx, BOOL *stop))predicate;

@end
