//
//  NSString+StringUtility.m
//
//  Created by Bharath G M on 7/10/14.
//  Copyright (c) 2014 SST Software All rights reserved.
//

#import "NSString+StringUtility.h"

@implementation NSString (StringUtility)

- (BOOL) containsSubstring:(NSString*)substring
{
    return [self rangeOfString:substring].location != NSNotFound;
}

- (BOOL) hasContent
{
    return ![[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""];
}


- (NSString*) stringTruncatedTo:(NSUInteger)maximumLength
{
    if(self.length <= maximumLength)
        return self;
    
    return [self substringWithRange:NSMakeRange(0, maximumLength)];
}

- (BOOL) startsWith:(NSString*)beginningString
{
    return [[self substringToIndex:beginningString.length] isEqualToString:beginningString];
}

- (BOOL) isCaseInsensitivelyEqualTo:(NSString*)otherString
{
    return ([self caseInsensitiveCompare:otherString] == NSOrderedSame);
}

+ (BOOL) string:(NSString*)one contentEquals:(NSString*)two
{
    // If both are nil they are the same
    if(one == nil && two == nil)
        return YES;

    // If either is nil but not both they are different
    if(one == nil || two == nil)
        return NO;

    // Run regular equality operation
    return [one isEqualToString:two];
}

- (NSString*) orNil
{
    return (self.hasContent) ? self:nil;
}
@end
