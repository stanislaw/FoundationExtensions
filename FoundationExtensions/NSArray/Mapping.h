// FoundationExtensions
//
// FoundationExtensions/NSArray/Mapping.h
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import <Foundation/NSArray.h>

@interface NSArray (Mapping)

- (NSArray *)mapObjectsUsingBlock:(id(^)(id element, NSUInteger idx, BOOL *stop))block;

@end
