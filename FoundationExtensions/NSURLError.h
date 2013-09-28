//
//  NSURLError.h
//  FoundationExtensions
//
//  Created by Stanislaw Pankevich on 6/5/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

NSStringFromMethodForEnumType(NSURLErrorCode,
                              NSInteger,

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
