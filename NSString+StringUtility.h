//
//  NSString+StringUtility.h
//
//  Created by Bharath G M on 7/10/14.
//  Copyright (c) 2014 SST Software All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Category for basic helper functions on a string
 */
@interface NSString (StringUtility)

/**
 * YES if the given substring is contained within this string anywhere
 */
- (BOOL) containsSubstring:(NSString*)substring;

/**
 * YES if the string is something other than empty whitespace.
 * We use the affirmative so that a nil valid also returns 'NO'
 */
- (BOOL) hasContent;

/**
 * Returns the original string truncated to a maximum length if it was over
 */
- (NSString*) stringTruncatedTo:(NSUInteger)maximumLength;

/**
 * YES if beginningString is the first part of this string
 */
- (BOOL) startsWith:(NSString*)beginningString;

/**
 * YES if the two strings match regardless of case
 */
- (BOOL) isCaseInsensitivelyEqualTo:(NSString*)otherString;

/**
 * Accounts for possibility of either one or two being nil.
 * YES if both are nil or both are equal to each other.
 */
+ (BOOL) string:(NSString*)one contentEquals:(NSString*)two;

/**
 * Returns self if self has content, otherwise returns nil
 */
- (NSString*) orNil;

@end
