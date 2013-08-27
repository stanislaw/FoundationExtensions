//
//  OrderedCollectionProtocol.h
//  FoundationExtensionsApp
//
//  Created by Stanislaw Pankevich on 8/27/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UnorderedCollection.h"

@protocol NSOrderedCollection <NSUnorderedCollection>

- (id)objectAtIndex:(NSUInteger)index;

- (id)firstObject;
@property (readonly) NSUInteger lastIndex;

@end
