//
//  NSString+Validation.m
//  sstapp
//
//  Created by Bharath G M on 7/17/14.
//  Copyright (c) 2014 SST Software All rights reserved.
//

#import "NSString+Validation.h"

@implementation NSString (Validation)

- (BOOL) matchesRegularExpression:(NSString*)regexPattern
{
    NSError* error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexPattern
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:self
                                                        options:0
                                                          range:NSMakeRange(0, self.length)];
    if (numberOfMatches == 0)
        return NO;
    
    return YES;    
}

- (BOOL) validateFloatingPointNumber
{
    // Numeric with a potential sign and decimal component
    return [self matchesRegularExpression:@"^-?[0-9]*\\.?[0-9]*$"];
}

- (BOOL) validateNonLetters
{
    // Numeric & basic punctuation
    // Logic is reversed here because we throw it out if there ARE any characters (a-z) in it
    return ![self matchesRegularExpression:@"[A-Za-z]"];
}

- (BOOL) validateIntegerNumber
{
    // Numeric with a potential sign
    return [self matchesRegularExpression:@"^-?[0-9]*$"];
}

- (BOOL) validateName
{
    //Check valid characters and not just a bunch of spaces
    return (![self matchesRegularExpression:@"^[ ]*$"] && [self validateWithInvalidCharacters:[NSCharacterSet characterSetWithCharactersInString:@"'&\";%\\$*#?\t\r\n|"]]);
}

- (BOOL) valdiateEmailAddress
{
    return [self matchesRegularExpression:@"^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}$"];
}

- (BOOL) validateWithInvalidCharacters:(NSCharacterSet*)invalidCharacters
{
    return [self rangeOfCharacterFromSet:invalidCharacters].location == NSNotFound;
}

-(BOOL)validateInvalidCharactersForGeneralInfo
{
    NSCharacterSet *invalidCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@"'\"%\\$#*?\t\r\n"];
    return [self rangeOfCharacterFromSet:invalidCharacterSet].location == NSNotFound;
}
@end
