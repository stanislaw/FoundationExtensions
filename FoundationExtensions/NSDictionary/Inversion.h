// FoundationExtensions
//
// FoundationExtensions/NSDictionary/Inversion.h
//
// Inspired by: https://github.com/rubyworks/facets/blob/master/lib/core/facets/hash/inverse.rb
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import <Foundation/NSDictionary.h>

@interface NSDictionary (Inversion)

+ (NSDictionary *)inversedDictionaryFromDictionary:(NSDictionary *)dictionary;

@end
