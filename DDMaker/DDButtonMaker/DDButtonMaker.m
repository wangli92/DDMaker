//
//  DDButtonMaker.m
//  DDMakerExample
//
//  Created by wl on 2018/5/17.
//  Copyright © 2018年 wl. All rights reserved.
//

#import "DDButtonMaker.h"
#import <objc/runtime.h>
#define DDBtMakerStrongSelf(type)  __strong typeof(type) type = weak##type;
static char KBtnActionBlockKey;

@interface DDButtonMaker ()
/** 要创建的bt */
@property(nonatomic,strong) UIButton *creatingBT;
/** 记录bt的block点击事件 */
@property(nonatomic,copy) makerBtActionBlock creatingBtActionBlock;
@end

@implementation DDButtonMaker
-(instancetype)init
{
    self = [super init];
    if (self) {
        
        __weak typeof(self) weakself = self;
        //父视图
        _intoView = ^DDButtonMaker *(UIView *superV){
            DDBtMakerStrongSelf(self)
            //此处判断父视图，主要是为了严谨；不判断也OK
            if (superV && !self.creatingBT.superview) {
                [superV addSubview:self.creatingBT];
            }
            return self;
        };
        
        //frame
        _frame = ^DDButtonMaker *(CGRect frame){
            DDBtMakerStrongSelf(self)
            self.creatingBT.frame = frame;
            return self;
        };
        
        //背景色
        _bgColor = ^DDButtonMaker *(UIColor *color){
            DDBtMakerStrongSelf(self)
            self.creatingBT.backgroundColor = color;
            return self;
        };
        
        //字体颜色
        _titleColor = ^DDButtonMaker *(UIColor *titleColor,UIControlState state){
            DDBtMakerStrongSelf(self)
            [self.creatingBT setTitleColor:titleColor forState:state];
            return self;
        };
        _normalTitleColor = ^DDButtonMaker *(UIColor *normalTitleColor){
            DDBtMakerStrongSelf(self)
            [self.creatingBT setTitleColor:normalTitleColor forState:UIControlStateNormal];
            return self;
        };
        _highlightedTitleColor = ^DDButtonMaker *(UIColor *highlightedTitleColor){
            DDBtMakerStrongSelf(self)
            [self.creatingBT setTitleColor:highlightedTitleColor forState:UIControlStateHighlighted];
            return self;
        };
        
        
        //文字
        _title = ^DDButtonMaker *(NSString *title,UIControlState state){
            DDBtMakerStrongSelf(self)
            [self.creatingBT setTitle:title forState:state];
            return self;
        };
        _normalTitle = ^DDButtonMaker *(NSString *normalTitle){
            DDBtMakerStrongSelf(self)
            [self.creatingBT setTitle:normalTitle forState:UIControlStateNormal];
            return self;
        };
        _highlightedTitle = ^DDButtonMaker *(NSString *highlightedTitle){
            DDBtMakerStrongSelf(self)
            [self.creatingBT setTitle:highlightedTitle forState:UIControlStateHighlighted];
            return self;
        };
        
        //点击事件
        _actionBlock = ^DDButtonMaker *(makerBtActionBlock block){
            DDBtMakerStrongSelf(self)
            if (block) {
                self.creatingBtActionBlock = block;
            }
            return self;
        };
    }
    return self;
}

-(UIButton *)creatingBT
{
    if (!_creatingBT) {
        _creatingBT = [UIButton buttonWithType:UIButtonTypeCustom];
        [_creatingBT maker_actionWithBlock:^{
            if (self.creatingBtActionBlock) {
                self.creatingBtActionBlock();
            }
        }];
    }
    return _creatingBT;
}
@end

@implementation UIButton (DDMaker)
+(UIButton *)dd_btMake:(void (^)(DDButtonMaker *))make
{
    DDButtonMaker *btMaker = [[DDButtonMaker alloc]init];
    if (make) {
        make(btMaker);
    }
    return btMaker.creatingBT;
}

-(void)maker_actionWithControlEvent:(UIControlEvents )event
                          withBlock:(makerBtActionBlock)block
{
    objc_setAssociatedObject(self, &KBtnActionBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)maker_actionWithBlock:(makerBtActionBlock)block
{
    [self maker_actionWithControlEvent:UIControlEventTouchUpInside withBlock:block];
}

-(void)clickAction:(UIButton *)button{
    makerBtActionBlock block =objc_getAssociatedObject(self, &KBtnActionBlockKey);
    if (block) {
        block();
    }
}
@end
