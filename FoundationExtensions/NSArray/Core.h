//
//  NSArray+Extensions.h
//  aaah
//
//  Created by Stanislaw Pankevich on 2/24/13.
//  Copyright (c) 2013 IProjecting. All rights reserved.
//

#import <Foundation/Foundation.h>

BOOL NSArrayIsArrayAndNotEmpty(id object);

@interface NSArray (Core)

@property (readonly) id firstObject;
@property (readonly) NSUInteger lastIndex;

@property (readonly) BOOL isEmpty;
@property (readonly) BOOL isNotEmpty;

@end
