//
//  NSString+FriendlyFloat.m
//
//  Created by Bharath G M on 7/10/14.
//  Copyright (c) 2014 SST Software All rights reserved.
//

#import "NSString+FriendlyFloat.h"

@implementation NSString (FriendlyFloat)

/**
 * Display a float with as much precision as needed
 */
+ (NSString*) stringWithFriendlyFloat:(double)value
{
    if(value == INFINITY)
    {
        return @"";
    }
    
    // Get the basic format of the number
    NSString* number = [NSString stringWithFormat:@"%f", value];
    
    // We want to strip any 0s from either front or back
    if([number rangeOfString:@"."].location != NSNotFound)
    {
        number = [number stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"0"]];
    }
    
    // Now remove the . if it is trailing
    if(number.length>0 && [number characterAtIndex:number.length-1] == '.' )
    {
        number = [number stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
    }
    
    // Repair a 0 if everything was trimmed
    if([number isEqualToString:@""])
    {
        number = @"0";
    }
    
    return number;
}


/**
 * Display a float with as much precision as needed, but only up to maximum
 */
+ (NSString*) stringWithFriendlyFloat:(double)value maxPrecision:(int)max
{
    if(value == INFINITY)
    {
        return @"";
    }
    
    // Get the basic format of the number
    NSString* number = [NSString stringWithFormat:[NSString stringWithFormat:@"%%0.0%df",max], value];
    
    // We want to strip any 0s from either front or back
    if([number rangeOfString:@"."].location != NSNotFound)
    {
        number = [number stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"0"]];
    }
    
    // Now remove the . if it is trailing
    if(number.length>0 && [number characterAtIndex:number.length-1] == '.' )
    {
        number = [number stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
    }
    
    // Restore a 0 as the string if everything was trimmed (down to an empty string)
    if([number isEqualToString:@""])
    {
        number = @"0";
    }
    
    return number;
}


/**
 * Display a float with as much precision as needed, but at least as much as the given formatted number.
 */
+ (NSString*) stringWithFriendlyFloat:(double)value matchFormat:(NSString*)format
{
    if(value == INFINITY)
    {
        return @"";
    }
    
    NSString* number = [NSString stringWithFriendlyFloat:value];
    
    // Only match if there is a decimal point
    if(format != nil && [format rangeOfString:@"."].location != NSNotFound)
    {
        // See if we need to add the decimal point on
        if([number rangeOfString:@"."].location == NSNotFound)
        {
            number = [number stringByAppendingString:@"."];
        }
        // Find out how many decimals we have after the dot. (that isn't a true significant digits...)
        NSUInteger formatSignificantDigits = format.length - [format rangeOfString:@"."].location - 1;
        NSUInteger currentSignificantDigits = number.length - [number rangeOfString:@"."].location -1 ;
        while(currentSignificantDigits < formatSignificantDigits)
        {
            number = [number stringByAppendingString:@"0"];
            ++currentSignificantDigits;
        }
    }
    
    return number;
}

@end
