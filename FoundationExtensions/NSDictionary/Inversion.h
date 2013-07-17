//
//  NSDictionary+Inverse.h
//  FoundationExtensionsApp
//
//  Created by Stanislaw Pankevich on 7/17/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

// https://github.com/rubyworks/facets/blob/master/lib/core/facets/hash/inverse.rb

#import <Foundation/Foundation.h>

@interface NSDictionary (Inversion)

+ (NSDictionary *)inversedDictionaryFromDictionary:(NSDictionary *)dictionary;

@end
