//
//  NSRunLoop.h
//  FoundationExtensions
//
//  Created by Stanislaw Pankevich on 6/9/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

static inline void NSLogCFRunLoopRunInMode(UInt32 code) {
    switch (code) {
        case kCFRunLoopRunFinished:
            NSLog(@"kCFRunLoopRunFinished, %d", code);
            break;
        case kCFRunLoopRunStopped:
            NSLog(@"kCFRunLoopRunStopped, %d", code);
            break;
        case kCFRunLoopRunTimedOut:
            NSLog(@"kCFRunLoopRunTimedOut, %d", code);
            break;
        case kCFRunLoopRunHandledSource:
            NSLog(@"kCFRunLoopRunHandledSource, %d", code);
            break;
        default:
            break;
    }
}
