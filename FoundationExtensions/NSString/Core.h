//
//  NSString+Extensions.h
//  aaah
//
//  Created by Stanislaw Pankevich on 12/11/12.
//  Copyright (c) 2012 IProjecting. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const NON_BREAKING_SPACE_SYMBOL;

BOOL NSStringIsStringAndNotEmpty(NSString *string);

@interface NSString (Core)

+ (id)stringWithFormat:(NSString *)format array:(NSArray *)arguments;

@property (readonly) BOOL isEmpty;

@end
