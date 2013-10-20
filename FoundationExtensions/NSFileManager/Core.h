// FoundationExtensions
//
// FoundationExtensions/NSFileManager/Core.h
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import <Foundation/NSFileManager.h>

@interface NSFileManager (Core)

- (unsigned long long int)sizeOfDirectoryAtPath:(NSString *)directoryPath;
- (void)removeAllContentsFromDirectoryAtPath:(NSString *)directoryPath;

@end
