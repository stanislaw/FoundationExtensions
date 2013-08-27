//
//  NSArray+Extensions.h
//  aaah
//
//  Created by Stanislaw Pankevich on 2/24/13.
//  Copyright (c) 2013 IProjecting. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UnorderedCollection.h"
#import "OrderedCollection.h"

BOOL NSArrayIsArrayAndNotEmpty(id object);

@interface NSArray (Core) <NSOrderedCollection>
@end
