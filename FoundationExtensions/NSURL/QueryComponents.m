//
//  NSURL+QueryComponents.m
//  FoundationExtensionsApp
//
//  Created by Stanislaw Pankevich on 8/30/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

#import "QueryComponents.h"

#import "../NSString/URL.h"

@implementation NSURL (QueryComponents)

- (NSDictionary *)queryComponents {
    return self.query.dictionaryFromQueryComponents;
}

@end
