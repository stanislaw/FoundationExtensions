//
//  NSArray+Extensions.h
//  aaah
//
//  Created by Stanislaw Pankevich on 2/24/13.
//  Copyright (c) 2013 IProjecting. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Extensions)

@property (readonly) id firstObject;
@property (readonly) NSUInteger lastIndex;
@property (readonly) BOOL isEmpty;

- (NSArray *)map:(id(^)(id element))block;

@end