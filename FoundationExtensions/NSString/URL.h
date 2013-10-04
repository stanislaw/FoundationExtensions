// FoundationExtensions
//
// FoundationExtensions/NSString/URL.h
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import <Foundation/NSString.h>
#import <Foundation/NSDictionary.h>

@interface NSString (URL)

// http://stackoverflow.com/a/5410443/598057 by @badpirate
@property (readonly) NSString *stringByDecodingURLFormat;
@property (readonly) NSString *stringByEncodingURLFormat;
- (NSMutableDictionary *)dictionaryFromQueryComponents;

@end
