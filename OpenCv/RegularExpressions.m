//
//  RegularExpressions.m
//  OpenCv
//
//  Created by Riches on 2016/10/17.
//  Copyright © 2016年 Riches. All rights reserved.
//

#import "RegularExpressions.h"

@implementation RegularExpressions

// 判断是否是网址
+ (BOOL)isUrl:(NSString *)string {
    NSString *urlRegex = @"[a-zA-z]+://[^\\s]*";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegex];
    return [urlTest evaluateWithObject:string];
}

@end
