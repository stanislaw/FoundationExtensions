// FoundationExtensions
//
// FoundationExtensions/NSURLError.h
//
// Copyright (c) 2013 Stanislaw Pankevich
// Released under the MIT license

#import <Foundation/NSURLError.h>
#import "NSObjCRuntime.h"

NSStringFromMethodForEnumType(NSURLErrorCode,
                              int,

                              NSURLErrorCancelled,
                              NSURLErrorBadURL,
                              NSURLErrorTimedOut,
                              NSURLErrorUnsupportedURL,
                              NSURLErrorCannotFindHost,
                              NSURLErrorCannotConnectToHost,
                              NSURLErrorNetworkConnectionLost,
                              NSURLErrorDNSLookupFailed,
                              NSURLErrorHTTPTooManyRedirects,
                              NSURLErrorResourceUnavailable,
                              NSURLErrorNotConnectedToInternet,
                              NSURLErrorRedirectToNonExistentLocation,
                              NSURLErrorBadServerResponse,
                              NSURLErrorUserCancelledAuthentication,
                              NSURLErrorUserAuthenticationRequired,
                              NSURLErrorZeroByteResource,
                              NSURLErrorCannotDecodeRawData,
                              NSURLErrorCannotDecodeContentData,
                              NSURLErrorCannotParseResponse,
                              NSURLErrorFileIsDirectory,
                              NSURLErrorFileDoesNotExist,
                              NSURLErrorNoPermissionsToReadFile,
                              NSURLErrorDataLengthExceedsMaximum);

static inline NSString * NSStringFromNSURLError(NSError *error) {
    return NSStringFromNSURLErrorCode(error.code);
}
