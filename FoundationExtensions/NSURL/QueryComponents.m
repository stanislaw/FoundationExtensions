// FoundationExtensions
//
// FoundationExtensions/URL/QueryComponents.m
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import "QueryComponents.h"

#import "../NSString/URL.h"

@implementation NSURL (QueryComponents)

- (NSDictionary *)queryComponents {
    return self.query.dictionaryFromQueryComponents;
}

@end
