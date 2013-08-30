//
//  NSString+URL.m
//  FoundationExtensionsApp
//
//  Created by Stanislaw Pankevich on 8/30/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

#import "URL.h"

@implementation NSString (URL)

- (NSString *)stringByDecodingURLFormat {
    NSString *result = [self stringByReplacingOccurrencesOfString:@"+" withString:@" "];

    result = [result stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    return result;
}

- (NSString *)stringByEncodingURLFormat {
    NSString *result = [self stringByReplacingOccurrencesOfString:@" " withString:@"+"];

    result = [result stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    return result;
}

- (NSMutableDictionary *)dictionaryFromQueryComponents {
    NSMutableDictionary *queryComponents = [NSMutableDictionary dictionary];
    
    for (NSString *keyValuePairString in [self componentsSeparatedByString:@"&"]) {
        NSArray *keyValuePairArray = [keyValuePairString componentsSeparatedByString:@"="];

        if (keyValuePairArray.count < 2) continue; // Verify that there is at least one key, and at least one value.  Ignore extra = signs

        NSString *key   = [[keyValuePairArray objectAtIndex:0] stringByDecodingURLFormat];
        NSString *value = [[keyValuePairArray objectAtIndex:1] stringByDecodingURLFormat];

        NSMutableArray *results = [queryComponents objectForKey:key]; // URL spec says that multiple values are allowed per key

        if (results == nil) {
            results = [NSMutableArray arrayWithCapacity:1];
            [queryComponents setValue:results forKey:key];
        }

        [results addObject:value];
    }
    
    return queryComponents;
}

@end
