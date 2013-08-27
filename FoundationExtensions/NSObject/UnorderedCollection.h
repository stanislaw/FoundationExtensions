//
//  NSObject+Enumerable.h
//  FoundationExtensionsApp
//
//  Created by Stanislaw Pankevich on 8/27/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NSUnorderedCollection <NSObject>

- (NSUInteger)count;

@property (readonly) BOOL isEmpty;
@property (readonly) BOOL isNotEmpty;

@end
