//
//  NSString+RegularExpressions.h
//  aaah
//
//  Created by Stanislaw Pankevich on 5/12/13.
//  Copyright (c) 2013 IProjecting. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RegularExpressions)
- (BOOL)matches:(NSString *)regexp;
@end