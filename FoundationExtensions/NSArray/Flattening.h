// FoundationExtensions
//
// FoundationExtensions/NSArray/Flattening.h
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import <Foundation/NSArray.h>

@interface NSArray (Flattening)

- (NSArray *)flattenedArray;
- (NSArray *)recursivelyFlattenedArray;

@end
