// FoundationExtensions
//
// FoundationExtensions/NSDictionary/URL.h
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import <Foundation/NSDictionary.h>
#import <Foundation/NSString.h>

@interface NSDictionary (URL)

// http://stackoverflow.com/a/5410443/598057 by @badpirate
@property (readonly) NSString *stringFromQueryComponents;

@end
