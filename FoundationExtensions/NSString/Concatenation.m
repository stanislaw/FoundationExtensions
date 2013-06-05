//
//  NSString+Concatenation.m
//  aaah
//
//  Created by Stanislaw Pankevich on 3/27/13.
//  Copyright (c) 2013 IProjecting. All rights reserved.
//

#import "Concatenation.h"

@implementation NSString (Concatenation)

- (NSString *):(NSString *)a {
    return [self stringByAppendingString:a];
}

- (NSString *):(NSString *)a :(NSString *)b {
    return [[self:a]:b];
}

- (NSString *):(NSString *)a :(NSString *)b :(NSString *)c {
    return [[[self:a]:b]:c];
}

- (NSString *):(NSString *)a :(NSString *)b :(NSString *)c :(NSString *)d {
    return [[[[self:a]:b]:c]:d];
}

- (NSString *)concat:(NSString *)strings, ... {
    va_list args;
    va_start(args, strings);

    NSString *s;
    NSString *con = [self stringByAppendingString:strings];

    while((s = va_arg(args, NSString *)))
        con = [con stringByAppendingString:s];

    va_end(args);
    return con;
}

@end
