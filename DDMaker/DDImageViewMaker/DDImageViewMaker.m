//
//  DDImageViewMaker.m
//  DDMakerExample
//
//  Created by wl on 2018/5/17.
//  Copyright © 2018年 wl. All rights reserved.
//

#import "DDImageViewMaker.h"
#define DDImgVMakerStrongSelf(type)  __strong typeof(type) type = weak##type;
@interface DDImageViewMaker ()
/** 要创建的imageView */
@property(nonatomic,strong) UIImageView *creatingImageView;
@end
@implementation DDImageViewMaker
-(instancetype)init
{
    self = [super init];
    if (self) {
        
        __weak typeof(self) weakself = self;
        //父视图
        _intoView = ^DDImageViewMaker *(UIView *superV){
            DDImgVMakerStrongSelf(self)
            if (superV) {
                [superV addSubview:self.creatingImageView];
            }
            return self;
        };
        
        //frame
        _frame = ^DDImageViewMaker *(CGRect frame){
            DDImgVMakerStrongSelf(self)
            self.creatingImageView.frame = frame;
            return self;
        };
        
        //imageName
        _imageName = ^DDImageViewMaker *(NSString *imageName){
            DDImgVMakerStrongSelf(self)
            if (imageName && imageName.length > 0) {
                self.creatingImageView.image = [UIImage imageNamed:imageName];
            }
            return self;
        };
    }
    return self;
}
-(UIImageView *)creatingImageView
{
    if (!_creatingImageView) {
        _creatingImageView = [[UIImageView alloc]init];
        _creatingImageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _creatingImageView;
}
@end

@implementation UIImageView (DDMaker)
+(UIImageView *)dd_imgVMake:(void (^)(DDImageViewMaker *))make
{
    DDImageViewMaker *imgViewMaker = [[DDImageViewMaker alloc]init];
    if (make) {
        make(imgViewMaker);
    }
    return imgViewMaker.creatingImageView;
}
@end
