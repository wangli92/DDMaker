//
//  DDViewMaker.h
//  DDMakerExample
//
//  Created by wl on 2018/5/17.
//  Copyright © 2018年 wl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DDViewMaker : NSObject
/** superView */
@property (nonatomic,copy) DDViewMaker *(^intoView)(UIView *superV);
/** 背景色 */
@property (nonatomic,copy) DDViewMaker *(^bgColor)(UIColor *color);
/** frame */
@property (nonatomic,copy) DDViewMaker *(^frame)(CGRect frame);

@end

@interface UIView (DDMaker)
+(UIView *)dd_viewMake:(void(^)(DDViewMaker *maker))make;
@end







