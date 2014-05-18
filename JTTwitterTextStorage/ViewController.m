//
//  ViewController.m
//  JTTwitterTextStorage
//
//  Created by James Tang on 18/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import "ViewController.h"
#import "JTTwitterTextStorage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    JTTwitterTextStorage *textStorage = (JTTwitterTextStorage *)self.textView.textStorage;

    textStorage.tokens = @{
                           JTTwitterTextStorageDefaultAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor]},
                           @"#hashtag":@{NSForegroundColorAttributeName: [UIColor colorWithRed:0.000 green:0.568 blue:1.000 alpha:1.000]},
                           @"@mention":@{NSForegroundColorAttributeName: [UIColor colorWithRed:0.000 green:0.568 blue:1.000 alpha:1.000]},
                           @"Link":@{NSForegroundColorAttributeName: [UIColor lightGrayColor]},
                           @"Phone":@{NSForegroundColorAttributeName: [UIColor lightGrayColor]},
                           @"TextKit":@{NSForegroundColorAttributeName: [UIColor colorWithRed:0.000 green:0.568 blue:0.000 alpha:1.000],
                                        NSLinkAttributeName:@"http://asciiwwdc.com/2013/sessions/210",
                                        NSUnderlineStyleAttributeName:@(1),
                                        },
                           };
}

@end
