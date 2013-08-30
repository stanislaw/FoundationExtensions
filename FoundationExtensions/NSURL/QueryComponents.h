//
//  NSURL+QueryComponents.h
//  FoundationExtensionsApp
//
//  Created by Stanislaw Pankevich on 8/30/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (QueryComponents)

// http://stackoverflow.com/a/5410443/598057 by @badpirate
@property (readonly) NSDictionary *queryComponents;

@end
