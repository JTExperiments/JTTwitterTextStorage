//
//  JTResignKeyboardIntention.m
//  JTTwitterTextStorage
//
//  Created by James Tang on 18/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import "JTResignKeyboardIntention.h"

@implementation JTResignKeyboardIntention

- (IBAction)dismissButtonDidPress:(id)sender {
    [self.view endEditing:YES];
}

@end
