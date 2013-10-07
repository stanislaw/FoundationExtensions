// FoundationExtensions
//
// FoundationExtensions/NSOrderedSet/Core.h
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import <Foundation/NSOrderedSet.h>

@interface NSOrderedSet (Core)

- (id)firstObject;
@property (readonly) NSUInteger lastIndex;

@property (readonly) BOOL isEmpty;
@property (readonly) BOOL isNotEmpty;

- (id)anyObject;

@end
