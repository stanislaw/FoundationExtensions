// FoundationExtensions
//
// FoundationExtensions/NSString/Concatenation.h
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license
//
// http://stackoverflow.com/a/9730316/598057

#import <Foundation/NSString.h>

@interface NSString (Concatenation)

- (NSString *):(NSString *)a;
- (NSString *):(NSString *)a :(NSString *)b;
- (NSString *):(NSString *)a :(NSString *)b :(NSString *)c;
- (NSString *):(NSString *)a :(NSString *)b :(NSString *)c :(NSString *)d;

- (NSString *)concat:(NSString *)strings, ...;

@end
