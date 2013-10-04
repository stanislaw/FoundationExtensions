// FoundationExtensions
//
// FoundationExtensions/NSObject/UnorderedCollection.h
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import <Foundation/NSObject.h>

@protocol NSUnorderedCollection <NSObject>

- (NSUInteger)count;

@property (readonly) BOOL isEmpty;
@property (readonly) BOOL isNotEmpty;

@end
