// FoundationExtensions
//
// FoundationExtensions/URL/QueryComponents.h
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import <Foundation/NSURL.h>

@interface NSURL (QueryComponents)

// http://stackoverflow.com/a/5410443/598057 by @badpirate
@property (readonly) NSDictionary *queryComponents;

@end
