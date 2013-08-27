//
//  NSSet+Core.m
//  FoundationExtensionsApp
//
//  Created by Stanislaw Pankevich on 8/27/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

#import "Core.h"

@implementation NSSet (Core)

- (BOOL)isEmpty {
    return self.count == 0;
}

- (BOOL)isNotEmpty {
    return self.count > 0;
}

@end
