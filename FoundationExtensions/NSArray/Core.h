// FoundationExtensions
//
// FoundationExtensions/NSArray/Core.h
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import <Foundation/NSArray.h>

#import "../NSObject/UnorderedCollection.h"
#import "../NSObject/OrderedCollection.h"

BOOL NSArrayIsArrayAndNotEmpty(id object);

@interface NSArray (Core) <NSOrderedCollection>
@end
