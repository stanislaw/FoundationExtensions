//
//  NSString+Concatenation.h
//  aaah
//
//  Created by Stanislaw Pankevich on 3/27/13.
//  Copyright (c) 2013 IProjecting. All rights reserved.
//
//
// http://stackoverflow.com/a/9730316/598057

#import <Foundation/Foundation.h>

@interface NSString (Concatenation)

- (NSString *):(NSString *)a;
- (NSString *):(NSString *)a :(NSString *)b;
- (NSString *):(NSString *)a :(NSString *)b :(NSString *)c;
- (NSString *):(NSString *)a :(NSString *)b :(NSString *)c :(NSString *)d;

- (NSString *)concat:(NSString *)strings, ...;

@end
