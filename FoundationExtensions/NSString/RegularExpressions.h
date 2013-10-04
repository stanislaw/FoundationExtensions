// FoundationExtensions
//
// FoundationExtensions/NSString/RegularExpressions.h
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import <Foundation/NSString.h>

@interface NSString (RegularExpressions)
- (BOOL)matches:(NSString *)regularExpressionString;
@end
