//
//  DDLabelMaker.h
//  DDMakerExample
//
//  Created by wl on 2018/5/17.
//  Copyright © 2018年 wl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DDLabelMaker : NSObject
@property(nonatomic,copy) DDLabelMaker *(^intoView)(UIView *superV);
@property(nonatomic,copy) DDLabelMaker *(^frame)(CGRect frame);

@property(nonatomic,copy) DDLabelMaker *(^bgColor)(UIColor *bgColor);
@property(nonatomic,copy) DDLabelMaker *(^textColor)(UIColor *textColor);
@property(nonatomic,copy) DDLabelMaker *(^text)(NSString *text);
@property(nonatomic,copy) DDLabelMaker *(^attributedText)(NSAttributedString *attributedText);


@property(nonatomic,copy) DDLabelMaker *(^font)(UIFont *font);
@property(nonatomic,copy) DDLabelMaker *(^fontSize)(CGFloat fontSize);
@property(nonatomic,copy) DDLabelMaker *(^boldFontSize)(CGFloat boldFontSize);
@property(nonatomic,copy) DDLabelMaker *(^fontNameAndSize)(NSString *fontName,CGFloat fontSize);

@property(nonatomic,copy) DDLabelMaker *(^textAlignment)(NSTextAlignment textAlignment);
@property(nonatomic,copy) DDLabelMaker *(^numberOfLines)(NSInteger numberOfLines);
@end

@interface UILabel (DDMaker)
+(UILabel *)dd_lbMake:(void(^)(DDLabelMaker *maker))make;
@end
