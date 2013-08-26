//
//  NSURLError.h
//  FoundationExtensions
//
//  Created by Stanislaw Pankevich on 6/5/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

static inline NSString * NSStringForNSURLError(NSError *error) {
    NSString *string;

    switch (error.code) {
        case NSURLErrorCancelled:
            string = @"NSURLErrorCancelled";

            break;

        case NSURLErrorBadURL:
            string = @"NSURLErrorBadURL";

            break;

        case NSURLErrorTimedOut:
            string = @"NSURLErrorTimedOut";

            break;

        case NSURLErrorUnsupportedURL:
            string = @"NSURLErrorUnsupportedURL";

            break;

        case NSURLErrorCannotFindHost:
            string = @"NSURLErrorCannotFindHost";

            break;

        case NSURLErrorCannotConnectToHost:
            string = @"NSURLErrorCannotConnectToHost";

            break;

        case NSURLErrorNetworkConnectionLost:
            string = @"NSURLErrorNetworkConnectionLost";

            break;

        case NSURLErrorDNSLookupFailed:
            string = @"NSURLErrorDNSLookupFailed";

            break;

        case NSURLErrorHTTPTooManyRedirects:
            string = @"NSURLErrorHTTPTooManyRedirects";

            break;

        case NSURLErrorResourceUnavailable:
            string = @"NSURLErrorResourceUnavailable";

            break;

        case NSURLErrorNotConnectedToInternet:
            string = @"NSURLErrorNotConnectedToInternet";

            break;

        case NSURLErrorRedirectToNonExistentLocation:
            string = @"NSURLErrorRedirectToNonExistentLocation";

            break;

        case NSURLErrorBadServerResponse:
            string = @"NSURLErrorBadServerResponse";

            break;

        case NSURLErrorUserCancelledAuthentication:
            string = @"NSURLErrorUserCancelledAuthentication";

            break;

        case NSURLErrorUserAuthenticationRequired:
            string = @"NSURLErrorUserAuthenticationRequired";

            break;

        case NSURLErrorZeroByteResource:
            string = @"NSURLErrorZeroByteResource";

            break;

        case NSURLErrorCannotDecodeRawData:
            string = @"NSURLErrorCannotDecodeRawData";

            break;

        case NSURLErrorCannotDecodeContentData:
            string = @"NSURLErrorCannotDecodeContentData";

            break;

        case NSURLErrorCannotParseResponse:
            string = @"NSURLErrorCannotParseResponse";

            break;

        case NSURLErrorFileIsDirectory:
            string = @"NSURLErrorFileIsDirectory";

            break;

        case NSURLErrorFileDoesNotExist:
            string = @"NSURLErrorFileDoesNotExist";

            break;

        case NSURLErrorNoPermissionsToReadFile:
            string = @"NSURLErrorNoPermissionsToReadFile";
            
            break;
            
        case NSURLErrorDataLengthExceedsMaximum:
            string = @"NSURLErrorDataLengthExceedsMaximum";
            
            break;
            
        default:
            string = @"NSURLErrorUnknown";
            
            break;
    }
    
    return [NSString stringWithFormat:@"%@ %d", string, error.code];
}

static inline void NSLogNSURLError(int status) {
    NSLog(@"%@", NSStringForNSURLError(status));
}
