//
//  JTTwitterTextStorage.h
//  JTTwitterTextStorage
//
//  Created by James Tang on 18/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const JTTwitterTextStorageDefaultAttributes;

@interface JTTwitterTextStorage : NSTextStorage

@property (copy, nonatomic) NSDictionary *tokens;

@end
