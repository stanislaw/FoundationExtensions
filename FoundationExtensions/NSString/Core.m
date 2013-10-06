// FoundationExtensions
//
// FoundationExtensions/NSString/Core.m
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import "Core.h"

NSString * const NON_BREAKING_SPACE_SYMBOL = @"\u00A0";

@implementation NSString (Core)

+ (id)stringWithFormat:(NSString *)format array:(NSArray *)arguments {
    NSRange range = NSMakeRange(0, [arguments count]);
    NSMutableData* data = [NSMutableData dataWithLength:sizeof(id) * [arguments count]];
    [arguments getObjects:(__unsafe_unretained id *)data.mutableBytes range:range];
    NSString* result = [[NSString alloc] initWithFormat:format arguments:data.mutableBytes];

    return result;
}

- (BOOL)isEmpty {
    return self.length == 0;
}

@end
