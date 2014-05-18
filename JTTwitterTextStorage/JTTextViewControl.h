//
//  JTSelectableToggle.h
//  JTTwitterTextStorage
//
//  Created by James Tang on 18/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JTTextViewControl : NSObject

@property (weak, nonatomic) IBOutlet UITextView *textView;

- (IBAction)toggleEditable:(id)sender;

@end
