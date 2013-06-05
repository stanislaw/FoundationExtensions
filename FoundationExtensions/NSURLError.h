//
//  NSURLError.h
//  FoundationExtensions
//
//  Created by Stanislaw Pankevich on 6/5/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

static inline NSString * NSStringForNSURLError(int status) {
    switch (status) {
        case NSURLErrorCancelled:
            return [NSString stringWithFormat:@"NSURLErrorCancelled: %d", NSURLErrorCancelled];
            break;
        case NSURLErrorBadURL:
            return [NSString stringWithFormat:@"NSURLErrorBadURL: %d", NSURLErrorBadURL];
            break;
        case NSURLErrorTimedOut:
            return [NSString stringWithFormat:@"NSURLErrorTimedOut: %d", NSURLErrorTimedOut];
            break;
        case NSURLErrorUnsupportedURL:
            return [NSString stringWithFormat:@"NSURLErrorUnsupportedURL: %d", NSURLErrorUnsupportedURL];
            break;
        case NSURLErrorCannotFindHost:
            return [NSString stringWithFormat:@"NSURLErrorCannotFindHost: %d", NSURLErrorCannotFindHost];
            break;
        case NSURLErrorCannotConnectToHost:
            return [NSString stringWithFormat:@"NSURLErrorCannotConnectToHost: %d", NSURLErrorCannotConnectToHost];
            break;
        case NSURLErrorNetworkConnectionLost:
            return [NSString stringWithFormat:@"NSURLErrorNetworkConnectionLost: %d", NSURLErrorNetworkConnectionLost];
            break;
        case NSURLErrorDNSLookupFailed:
            return [NSString stringWithFormat:@"NSURLErrorDNSLookupFailed: %d", NSURLErrorDNSLookupFailed];
            break;
        case NSURLErrorHTTPTooManyRedirects:
            return [NSString stringWithFormat:@"NSURLErrorHTTPTooManyRedirects: %d", NSURLErrorHTTPTooManyRedirects];
            break;
        case NSURLErrorResourceUnavailable:
            return [NSString stringWithFormat:@"NSURLErrorResourceUnavailable: %d", NSURLErrorResourceUnavailable];
            break;
        case NSURLErrorNotConnectedToInternet:
            return [NSString stringWithFormat:@"NSURLErrorNotConnectedToInternet: %d", NSURLErrorNotConnectedToInternet];
            break;
        case NSURLErrorRedirectToNonExistentLocation:
            return [NSString stringWithFormat:@"NSURLErrorRedirectToNonExistentLocation: %d", NSURLErrorRedirectToNonExistentLocation];
            break;
        case NSURLErrorBadServerResponse:
            return [NSString stringWithFormat:@"NSURLErrorBadServerResponse: %d", NSURLErrorBadServerResponse];
            break;
        case NSURLErrorUserCancelledAuthentication:
            return [NSString stringWithFormat:@"NSURLErrorUserCancelledAuthentication: %d", NSURLErrorUserCancelledAuthentication];
            break;
        case NSURLErrorUserAuthenticationRequired:
            return [NSString stringWithFormat:@"NSURLErrorUserAuthenticationRequired: %d", NSURLErrorUserAuthenticationRequired];
            break;
        case NSURLErrorZeroByteResource:
            return [NSString stringWithFormat:@"NSURLErrorZeroByteResource: %d", NSURLErrorZeroByteResource];
            break;
        case NSURLErrorCannotDecodeRawData:
            return [NSString stringWithFormat:@"NSURLErrorCannotDecodeRawData: %d", NSURLErrorCannotDecodeRawData];
            break;
        case NSURLErrorCannotDecodeContentData:
            return [NSString stringWithFormat:@"NSURLErrorCannotDecodeContentData: %d", NSURLErrorCannotDecodeContentData];
            break;
        case NSURLErrorCannotParseResponse:
            return [NSString stringWithFormat:@"NSURLErrorCannotParseResponse: %d", NSURLErrorCannotParseResponse];
            break;
        case NSURLErrorFileIsDirectory:
            return [NSString stringWithFormat:@"NSURLErrorFileIsDirectory: %d", NSURLErrorFileIsDirectory];
            break;
        case NSURLErrorFileDoesNotExist:
            return [NSString stringWithFormat:@"NSURLErrorFileDoesNotExist: %d", NSURLErrorFileDoesNotExist];
            break;
        case NSURLErrorNoPermissionsToReadFile:
            return [NSString stringWithFormat:@"NSURLErrorNoPermissionsToReadFile: %d", NSURLErrorNoPermissionsToReadFile];
            break;
        case NSURLErrorDataLengthExceedsMaximum:
            return [NSString stringWithFormat:@"NSURLErrorDataLengthExceedsMaximum: %d", NSURLErrorDataLengthExceedsMaximum];
            break;
        default:
            break;
    }

    return [NSString stringWithFormat:@"NSURLError unknown code: %d", status];
}

static inline NSString * NSLogNSURLError(int status) {
    NSLog(@"%@", NSStringForNSURLError(status));
}