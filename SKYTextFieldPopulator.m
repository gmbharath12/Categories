//
//  SKYTextFieldPopulator.m
//  Sirrus
//
//  Created by Bharath G M on 7/17/14.
//  Copyright (c) 2014 SST Software All rights reserved.
//

#import "SKYTextFieldPopulator.h"

@implementation SKYTextFieldPopulator

/** 
 *This method adds a magnifying glass to a provided text field.
 */
+(void) addMagnifyingGlassToTextField:(UITextField*) textField
{
    // Create magnifying glass icon in search textfield
    UILabel* magGlass = [[UILabel alloc] init];
    [magGlass setText:[NSString stringWithUTF8String:"\xF0\x9F\x94\x8D"]];
    [magGlass sizeToFit];
    [textField setLeftView:magGlass];
    [textField setLeftViewMode:UITextFieldViewModeAlways];
}
@end
