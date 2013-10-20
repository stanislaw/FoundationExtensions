//
//  NSFileManager+Core.h
//  TestsApp
//
//  Created by Stanislaw Pankevich on 10/20/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Core)

- (unsigned long long int)sizeOfDirectoryAtPath:(NSString *)directoryPath;
- (void)removeAllContentsFromDirectoryAtPath:(NSString *)directoryPath;

@end
