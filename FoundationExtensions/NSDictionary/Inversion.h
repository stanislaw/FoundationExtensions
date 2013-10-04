// FoundationExtensions
//
// FoundationExtensions/NSDictionary/Inversion.h
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

// https://github.com/rubyworks/facets/blob/master/lib/core/facets/hash/inverse.rb
#import <Foundation/NSDictionary.h>

@interface NSDictionary (Inversion)

+ (NSDictionary *)inversedDictionaryFromDictionary:(NSDictionary *)dictionary;

@end
