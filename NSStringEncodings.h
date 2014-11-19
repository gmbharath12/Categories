//
//  NSStringUrlEncode.h
//  sstapp
//
//  Created by Bharath G M on 7/17/14.
//  Copyright (c) 2014 SST Software All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (UrlEncode)

@property (readonly) NSString* urlDecoded;

@property (readonly) NSString* urlEncoded;

/**
 * Encode a url path (leave '/' alone)
 */
@property (readonly) NSString* urlPathEncoded;

@property (readonly) NSString* md5Encoded;

@end


@interface NSData (Digest)

/**
 * Returns a hex string representation of the md5 digest of this data
 */
@property (readonly) NSString* md5DigestString;

@end