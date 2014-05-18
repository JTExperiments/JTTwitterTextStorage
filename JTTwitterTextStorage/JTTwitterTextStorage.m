//
//  JTTwitterTextStorage.m
//  JTTwitterTextStorage
//
//  Created by James Tang on 18/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import "JTTwitterTextStorage.h"

NSString *const JTTwitterTextStorageDefaultAttributes = @"JTTwitterTextStorageDefaultAttributes";

@interface JTTwitterTextStorage ()

@property (strong, nonatomic) NSMutableAttributedString *backingStore;
@property (nonatomic) BOOL dynamicTextNeedsUpdate;

@end

@implementation JTTwitterTextStorage

- (id)init {
    self = [super init];
    if (self) {
        _backingStore = [[NSMutableAttributedString alloc] init];
    }
    return self;
}

- (NSString *)string {
    return _backingStore.string;
}

- (NSDictionary *)attributesAtIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range {
    return [self.backingStore attributesAtIndex:location effectiveRange:range];
}

- (void)replaceCharactersInRange:(NSRange)range withString:(NSString *)str {
    [_backingStore replaceCharactersInRange:range withString:str];
    [self edited:NSTextStorageEditedCharacters|NSTextStorageEditedAttributes
           range:range changeInLength:str.length-range.length];
    _dynamicTextNeedsUpdate = YES;
}

- (void)setAttributes:(NSDictionary *)attrs range:(NSRange)range {
    [_backingStore setAttributes:attrs
                           range:range];

    [self edited:NSTextStorageEditedAttributes range:range changeInLength:0];
}

- (void)processEditing {

    if (_dynamicTextNeedsUpdate) {
        _dynamicTextNeedsUpdate = NO;
        [self performReplacementsForCharacterChangeInRange:[self editedRange]];
    }

    [super processEditing];
}

#pragma mark Helper

- (void)performReplacementsForCharacterChangeInRange:(NSRange)changedRange {
    NSRange extendedRange = NSUnionRange(changedRange, [[_backingStore string] lineRangeForRange:NSMakeRange(changedRange.location, 0)]);

    extendedRange = NSUnionRange(changedRange, [[_backingStore string] lineRangeForRange:NSMakeRange(NSMaxRange(changedRange), 0)]);

    [self applyTokenAttributesToRange:extendedRange];
}

- (void)applyTokenAttributesToRange:(NSRange)searchRange {
    NSDictionary *defaultAttributes = self.tokens[JTTwitterTextStorageDefaultAttributes];

    [_backingStore.string enumerateSubstringsInRange:searchRange
                                                 options:NSStringEnumerationByWords
                                              usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                                  NSDictionary *attributesForToken = self.tokens[substring] ?: defaultAttributes;

                                                  if (attributesForToken) {
                                                      [self addAttributes:attributesForToken
                                                                    range:substringRange];
                                                  }
                                              }];
}

#pragma mark Overrides

- (void)setTokens:(NSDictionary *)tokens {
    _tokens = [tokens copy];
    _dynamicTextNeedsUpdate = YES;

    [self edited:NSTextStorageEditedAttributes range:NSMakeRange(0, [self.string length]) changeInLength:0];
}

@end
