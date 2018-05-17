//
//  DDImageViewMaker.h
//  DDMakerExample
//
//  Created by wl on 2018/5/17.
//  Copyright © 2018年 wl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DDImageViewMaker : NSObject
@property(nonatomic,copy) DDImageViewMaker *(^intoView)(UIView *superV);
@property(nonatomic,copy) DDImageViewMaker *(^frame)(CGRect frame);
@property(nonatomic,copy) DDImageViewMaker *(^imageName)(NSString *imageName);
@end

@interface UIImageView (DDMaker)
+(UIImageView *)dd_imgVMake:(void(^)(DDImageViewMaker *maker))make;
@end
