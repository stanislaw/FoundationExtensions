// FoundationExtensions
//
// FoundationExtensions/NSDictionary/URL.m
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import "URL.h"
#import "../NSString/URL.h"

@implementation NSDictionary (URL)

- (NSString *)stringFromQueryComponents {
    NSString *result = nil;

    for (__strong NSString *key in self.allKeys) {
        key = [key stringByEncodingURLFormat];

        NSArray *allValues = [self objectForKey:key];
        
        if ([allValues isKindOfClass:[NSArray class]]) {
            for (__strong NSString *value in allValues) {
                value = value.description.stringByEncodingURLFormat;

                if (result == nil) {
                    result = [NSString stringWithFormat:@"%@=%@",key,value];
                } else {
                    result = [result stringByAppendingFormat:@"&%@=%@",key,value];
                }
            }
        } else {
            NSString *value = allValues.description.stringByEncodingURLFormat;

            if (result == nil) {
                result = [NSString stringWithFormat:@"%@=%@",key,value];
            } else {
                result = [result stringByAppendingFormat:@"&%@=%@",key,value];
            }
        }
    }
    
    return result;
}

@end
