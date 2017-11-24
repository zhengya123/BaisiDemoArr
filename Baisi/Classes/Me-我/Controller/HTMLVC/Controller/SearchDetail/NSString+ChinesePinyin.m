//
//  NSString+ChinesePinyin.m
//  Baisi
//
//  Created by 中商国际 on 2017/11/24.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "NSString+ChinesePinyin.h"

@implementation NSString (ChinesePinyin)
// pinyin
- (NSString *)transformToPinyin{
    NSMutableString * mutableString = [NSMutableString stringWithString:self];
    CFStringTransform((CFMutableStringRef) mutableString, NULL, kCFStringTransformToLatin, false);
    mutableString = (NSMutableString *)[mutableString stringByFoldingWithOptions:NSDiacriticInsensitiveSearch locale:[NSLocale currentLocale]];
    mutableString = [[mutableString stringByReplacingOccurrencesOfString:@" " withString:@""] mutableCopy];
    return mutableString.lowercaseString;
}
//
- (NSString * )transformToPinyinFirstLetter{
    NSMutableString * stringM = [NSMutableString string];
    
    NSString * temp = nil;
    for (int i = 0; i < [self length]; i ++) {
        
        temp = [self substringWithRange:NSMakeRange(i, 1)];
        
        NSMutableString * mutableString = [NSMutableString stringWithString:temp];
        
        CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformToLatin, false);
        
        mutableString = (NSMutableString *)[mutableString stringByFoldingWithOptions:NSDiacriticInsensitiveSearch locale:[NSLocale currentLocale]];
        
        mutableString = [[mutableString substringToIndex:1] mutableCopy];
        
        [stringM appendString:(NSString *)mutableString];
    }
    return stringM.lowercaseString;
}

@end
