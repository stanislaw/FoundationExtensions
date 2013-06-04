//
//  NSString+Extensions.m
//  aaah
//
//  Created by Stanislaw Pankevich on 12/11/12.
//  Copyright (c) 2012 IProjecting. All rights reserved.
//

#import "NSString+Extensions.h"

NSString * const NON_BREAKING_SPACE_SYMBOL = @"\u00A0";

BOOL NSStringIsStringAndNotEmpty(NSString *string) {
    if (!string || [string isKindOfClass:NSNull.class]) return NO;

    if (![string isKindOfClass:NSString.class]) return NO;

    if ([string respondsToSelector:@selector(length)] && string.length > 0) return YES;
    
    return NO;
}

NSString * NSStringURLWithoutSignature (NSString *string) {
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(\\?.*)?" options:NSRegularExpressionCaseInsensitive error:&error];
    NSString *modifiedString = [regex stringByReplacingMatchesInString:string options:0 range:NSMakeRange(0, string.length) withTemplate:@""];

    return modifiedString;
}

NSString * NSStringURLWithHTMLTagsRipped (NSString *string) {
    if (!NSStringIsStringAndNotEmpty(string)) return nil;

    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"<(\\/)?.*?>" options:NSRegularExpressionCaseInsensitive error:&error];
    NSString *modifiedString = [regex stringByReplacingMatchesInString:string options:0 range:NSMakeRange(0, string.length) withTemplate:@""];
    return modifiedString;
}

NSString * NSStringHTMLToSimpleMarkup (NSString *string) {
    NSError *error = NULL;

    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"<br(\\s)?(\\/)?>" options:NSRegularExpressionCaseInsensitive error:&error];
    NSString *modifiedString = [regex stringByReplacingMatchesInString:string options:0 range:NSMakeRange(0, string.length) withTemplate:@"\n"];
    
    regex = [NSRegularExpression regularExpressionWithPattern:@"(\\n){1,}" options:NSRegularExpressionCaseInsensitive error:&error];
    modifiedString = [regex stringByReplacingMatchesInString:modifiedString options:0 range:NSMakeRange(0, modifiedString.length) withTemplate:@"\n"];

    modifiedString = [modifiedString stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];

    return NSStringURLWithHTMLTagsRipped(modifiedString);
}

@implementation NSString (Extensions)

+ (id)stringWithFormat:(NSString *)format array:(NSArray *)arguments {
    NSRange range = NSMakeRange(0, [arguments count]);
    NSMutableData* data = [NSMutableData dataWithLength:sizeof(id) * [arguments count]];
    [arguments getObjects:(__unsafe_unretained id *)data.mutableBytes range:range];
    NSString* result = [[NSString alloc] initWithFormat:format arguments:data.mutableBytes];

    return result;
}

- (BOOL)isEmpty {
    return self.length == 0;
}

@end
