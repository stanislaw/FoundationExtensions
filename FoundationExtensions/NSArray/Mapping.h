//
//  NSArray+Mapping.h
//  FoundationExtensionsApp
//
//  Created by Stanislaw Pankevich on 7/19/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Mapping)

- (NSArray *)mapObjectsUsingBlock:(id(^)(id element, NSUInteger idx, BOOL *stop))block;

@end
