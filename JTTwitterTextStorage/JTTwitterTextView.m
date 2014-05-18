//
//  JTTwitterTextView.m
//  JTTwitterTextStorage
//
//  Created by James Tang on 18/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import "JTTwitterTextView.h"
#import "JTTwitterTextStorage.h"

@implementation JTTwitterTextView

- (id)awakeAfterUsingCoder:(NSCoder *)aDecoder {

    JTTwitterTextStorage *textStorage = [[JTTwitterTextStorage alloc] init];

    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];

    NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:self.frame.size];

    textContainer.widthTracksTextView = YES;

    [layoutManager addTextContainer:textContainer];
    [textStorage addLayoutManager:layoutManager];

    UITextView *textView = [[UITextView alloc] initWithFrame:self.frame textContainer:textContainer];

    // Bring everything specified from IB to the new view
    NSDictionary *dict = [self dictionaryWithValuesForKeys:@[
                                                             @"delegate", @"text", @"font",
                                                             @"textColor", @"textAlignment",
                                                             @"selectedRange", @"editable",
                                                             @"selectable", @"dataDetectorTypes",
                                                             @"allowsEditingTextAttributes", @"attributedText",
                                                             @"typingAttributes", @"linkTextAttributes",
                                                             ]];
    [textView setValuesForKeysWithDictionary:dict];

    return textView;
}

@end
