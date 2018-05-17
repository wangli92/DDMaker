//
//  DDLabelMaker.m
//  DDMakerExample
//
//  Created by wl on 2018/5/17.
//  Copyright © 2018年 wl. All rights reserved.
//

#import "DDLabelMaker.h"
#define DDLbMakerStrongSelf(type)  __strong typeof(type) type = weak##type;

@interface DDLabelMaker ()
/** 要创建的UILabel对象 */
@property(nonatomic,strong) UILabel *creatingLB;
@end

@implementation DDLabelMaker
-(instancetype)init
{
    self = [super init];
    if (self) {
        
        __weak typeof(self) weakself = self;
        //父视图
        _intoView = ^DDLabelMaker *(UIView *superV){
            DDLbMakerStrongSelf(self)
            if (superV) {
                [superV addSubview:self.creatingLB];
            }
            return self;
        };
        
        //frame
        _frame = ^DDLabelMaker *(CGRect frame){
            DDLbMakerStrongSelf(self)
            self.creatingLB.frame = frame;
            return self;
        };
        
        //背景色
        _bgColor = ^DDLabelMaker *(UIColor *color){
            DDLbMakerStrongSelf(self)
            self.creatingLB.backgroundColor = color;
            return self;
        };
        //字体颜色
        _textColor = ^DDLabelMaker *(UIColor *color){
            DDLbMakerStrongSelf(self)
            self.creatingLB.textColor = color;
            return self;
        };
        //文字
        _text = ^DDLabelMaker *(NSString *text){
            DDLbMakerStrongSelf(self)
            self.creatingLB.text = text;
            return self;
        };
        _attributedText = ^DDLabelMaker *(NSAttributedString *aStr){
            DDLbMakerStrongSelf(self)
            self.creatingLB.attributedText = aStr;
            return self;
        };
        
        //font
        _font = ^DDLabelMaker *(UIFont *font){
            DDLbMakerStrongSelf(self)
            self.creatingLB.font = font;
            return self;
        };
        _fontSize = ^DDLabelMaker *(CGFloat fontSize){
            DDLbMakerStrongSelf(self)
            self.creatingLB.font = [UIFont systemFontOfSize:fontSize];
            return self;
        };
        _boldFontSize = ^DDLabelMaker *(CGFloat boldFontSize){
            DDLbMakerStrongSelf(self)
            self.creatingLB.font = [UIFont boldSystemFontOfSize:boldFontSize];
            return self;
        };
        _fontNameAndSize = ^DDLabelMaker *(NSString *fontName,CGFloat fontSize){
            DDLbMakerStrongSelf(self)
            self.creatingLB.font = [UIFont fontWithName:fontName size:fontSize];
            return self;
        };
        //对齐方式
        _textAlignment = ^DDLabelMaker *(NSTextAlignment textAlignment){
            DDLbMakerStrongSelf(self)
            self.creatingLB.textAlignment = textAlignment;
            return self;
        };
        //numberOfLines
        _numberOfLines = ^DDLabelMaker *(NSInteger numberOfLines){
            DDLbMakerStrongSelf(self)
            self.creatingLB.numberOfLines = numberOfLines;
            return self;
        };
    }
    return self;
}

-(UILabel *)creatingLB
{
    if (!_creatingLB) {
        _creatingLB = [[UILabel alloc]init];
    }
    return _creatingLB;
}
@end
@implementation UILabel (DDMaker)
+(UILabel *)dd_lbMake:(void (^)(DDLabelMaker *))make
{
    DDLabelMaker *lbMaker = [[DDLabelMaker alloc]init];
    if (make) {
        make(lbMaker);
    }
    return lbMaker.creatingLB;
}
@end
