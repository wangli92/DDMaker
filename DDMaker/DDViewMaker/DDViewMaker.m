//
//  DDViewMaker.m
//  DDMakerExample
//
//  Created by wl on 2018/5/17.
//  Copyright © 2018年 wl. All rights reserved.
//

#import "DDViewMaker.h"
#define DDViewMakerStrongSelf(type) __strong typeof(type) type = weak##type;

@interface DDViewMaker()
/** 要创建的view*/
@property(nonatomic,strong) UIView *creatingView;
@end

@implementation DDViewMaker
-(instancetype)init
{
    self = [super init];
    if (self) {
        __weak typeof (self) weakself = self;
        //父视图
        _intoView = ^DDViewMaker *(UIView *superV){
            DDViewMakerStrongSelf(self)
            if (superV) {
                [superV addSubview:self.creatingView];
            }
            return self;
        };
        //背景色
        _bgColor = ^DDViewMaker *(UIColor *color){
            DDViewMakerStrongSelf(self)
            self.creatingView.backgroundColor = color;
            return self;
        };
        //frame
        _frame = ^DDViewMaker *(CGRect frame){
          DDViewMakerStrongSelf(self)
            self.creatingView.frame = frame;
            return self;
        };
    }
    return self;
}
#pragma mark - 懒加载
-(UIView *)creatingView
{
    if (!_creatingView) {
        _creatingView = [[UIView alloc] init];
    }
    return _creatingView;
}
@end


@implementation UIView (DDMaker)
+(UIView *)dd_viewMake:(void(^)(DDViewMaker *maker))make
{
    DDViewMaker *viewMaker = [[DDViewMaker alloc] init];
    if (make) {
        make(viewMaker);
    }
    return viewMaker.creatingView;
}
@end
