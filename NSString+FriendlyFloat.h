//
//  NSString+FriendlyFloat.h
//
//  Created by Bharath G M on 7/10/14.
//  Copyright (c) 2014 SST Software All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Category for formatting a floating point value (double) in a sane way.
 */
@interface NSString (FriendlyFloat)

/**
 * Display a float with as much precision as needed, no trailing 0s.
 */
+ (NSString*) stringWithFriendlyFloat:(double)value;

/**
 * Display a float with as much precision as needed, but at least as much as the given formatted number.
 */
+ (NSString*) stringWithFriendlyFloat:(double)value matchFormat:(NSString*)format;

/**
 * Display a float with as much precision as needed, but only up to maximum
 */
+ (NSString*) stringWithFriendlyFloat:(double)value maxPrecision:(int)max;

@end
