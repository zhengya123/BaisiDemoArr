//
//  NSString+ChinesePinyin.h
//  Baisi
//
//  Created by 中商国际 on 2017/11/24.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ChinesePinyin)
/**
 *  拼音 -> pinyin
 */
- (NSString *)transformToPinyin;

/**
 *  拼音首字母 -> py
 */
- (NSString *)transformToPinyinFirstLetter;
@end
