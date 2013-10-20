#import "TestHelpers.h"

#import "NSFileManager.h"

SPEC_BEGIN(NSFileManager_Core_Spec)

describe(@"NSFileManager/Core", ^{

    describe(@"-[NSFileManager removeAllContentsFromDirectoryAtPath:]", ^{
        specify(^{
            NSString *directoryPath =  [NSString stringWithFormat:@"%@%@", NSTemporaryDirectory(), @"tempDirectoryPath"];

            NSError *error = nil;
            [[NSFileManager defaultManager] removeItemAtPath:directoryPath error:&error];

            BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:directoryPath isDirectory:NULL];
            [[theValue(fileExists) should] beNo];

            error = nil;
            [[NSFileManager defaultManager] createDirectoryAtPath:directoryPath withIntermediateDirectories:NO attributes:nil error:&error];

            fileExists = [[NSFileManager defaultManager] fileExistsAtPath:directoryPath isDirectory:NULL];
            [[theValue(fileExists) should] beYes];

            [[theValue(YES) should] beYes];

            NSString *contentsPath1 =  [NSString stringWithFormat:@"%@%@%@", NSTemporaryDirectory(), @"tempDirectoryPath", @"/folder1/folder2/folder3"];
            [[NSFileManager defaultManager] createDirectoryAtPath:contentsPath1 withIntermediateDirectories:YES attributes:nil error:&error];
            BOOL contentsPath1Exists = [[NSFileManager defaultManager] fileExistsAtPath:contentsPath1 isDirectory:NULL];
            [[theValue(contentsPath1Exists) should] beYes];

            [[NSFileManager defaultManager] removeAllContentsFromDirectoryAtPath:directoryPath];

            contentsPath1Exists = [[NSFileManager defaultManager] fileExistsAtPath:contentsPath1 isDirectory:NULL];
            [[theValue(contentsPath1Exists) should] beNo];
        });
    });
});

SPEC_END
