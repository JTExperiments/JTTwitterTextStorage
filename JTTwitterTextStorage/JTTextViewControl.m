//
//  JTSelectableToggle.m
//  JTTwitterTextStorage
//
//  Created by James Tang on 18/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import "JTTextViewControl.h"

@implementation JTTextViewControl

- (IBAction)toggleEditable:(id)sender {
    self.textView.editable = ! self.textView.isEditable;
}

@end
