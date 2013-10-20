// FoundationExtensions
//
// FoundationExtensions/NSFileManager/Core.m
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import "Core.h"

@implementation NSFileManager (Core)

- (unsigned long long int)sizeOfDirectoryAtPath:(NSString *)directoryPath {
    NSArray *filesArray = [NSFileManager.defaultManager subpathsOfDirectoryAtPath:directoryPath error:nil];

    NSString *fileName;
    unsigned long long int fileSize = 0;

    for (fileName in filesArray) {
        NSDictionary *fileDictionary = [NSFileManager.defaultManager attributesOfItemAtPath:[directoryPath stringByAppendingPathComponent:fileName] error:nil];
        fileSize += [fileDictionary fileSize];
    }

    return fileSize;
}

- (void)removeAllContentsFromDirectoryAtPath:(NSString *)directoryPath {
    NSError *error;

    NSLog(@"Removing all contents from directory at path: %@", directoryPath);

    for (NSString *file in [NSFileManager.defaultManager contentsOfDirectoryAtPath:directoryPath error:&error]) {
        NSString *path = [directoryPath stringByAppendingPathComponent:file];

        NSLog(@"Removing: %@", path);

        [NSFileManager.defaultManager removeItemAtPath:path error:&error];

        if (error) {
            NSLog(@"Removal error: %@, %@", path, error);
        }
    }

    NSLog(@"Finished removing all contents from directory at path: %@", directoryPath);
}

@end
