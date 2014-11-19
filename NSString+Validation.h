//
//  NSString+Validation.h
//  sstapp
//
//  Created by Bharath G M on 7/17/14.
//  Copyright (c) 2014 SST Software All rights reserved.
//

@interface NSString (Validation)

- (BOOL) validateFloatingPointNumber;
- (BOOL) validateNonLetters;
- (BOOL) validateIntegerNumber;
- (BOOL) validateName;
- (BOOL) validateWithInvalidCharacters:(NSCharacterSet*)invalidCharacters;
- (BOOL) valdiateEmailAddress;
-(BOOL)validateInvalidCharactersForGeneralInfo;
@end
