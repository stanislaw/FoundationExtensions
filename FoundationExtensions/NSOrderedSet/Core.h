//
//  NSOrderedSet+Core.h
//  FoundationExtensionsApp
//
//  Created by Stanislaw Pankevich on 8/8/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSOrderedSet (Core)

@property (readonly) NSUInteger lastIndex;

@property (readonly) BOOL isEmpty;
@property (readonly) BOOL isNotEmpty;

@end
