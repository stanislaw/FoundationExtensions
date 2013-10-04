// FoundationExtensions
//
// FoundationExtensions/NSObject/OrderedCollection.h
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import <Foundation/NSObject.h>

#import "UnorderedCollection.h"

@protocol NSOrderedCollection <NSUnorderedCollection>

- (id)objectAtIndex:(NSUInteger)index;

- (id)firstObject;
@property (readonly) NSUInteger lastIndex;

@end
