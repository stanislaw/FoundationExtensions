//
//  NSArray+Flattening.h
//  FoundationExtensionsApp
//
//  Created by Stanislaw Pankevich on 7/17/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Flattening)

- (NSArray *)flattenedArray;
- (NSArray *)recursivelyFlattenedArray;

@end
