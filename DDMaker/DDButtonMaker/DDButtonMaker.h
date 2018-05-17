//
//  DDButtonMaker.h
//  DDMakerExample
//
//  Created by wl on 2018/5/17.
//  Copyright © 2018年 wl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^makerBtActionBlock)(void);

@interface DDButtonMaker : NSObject

@property(nonatomic,copy) DDButtonMaker *(^intoView)(UIView *superV);
@property(nonatomic,copy) DDButtonMaker *(^frame)(CGRect frame);
@property(nonatomic,copy) DDButtonMaker *(^bgColor)(UIColor *bgColor);

/**【通用】 设置state对应的titleColor */
@property(nonatomic,copy) DDButtonMaker *(^titleColor)(UIColor *titleColor,UIControlState state);
/** 设置normal对应的titleColor */
@property(nonatomic,copy) DDButtonMaker *(^normalTitleColor)(UIColor *normalTitleColor);
/** 设置Highlighted对应的titleColor */
@property(nonatomic,copy) DDButtonMaker *(^highlightedTitleColor)(UIColor *highlightedTitleColor);

/**【通用】 设置state对应的title */
@property(nonatomic,copy) DDButtonMaker *(^title)(NSString *title,UIControlState state);
/** 设置normal对应的title */
@property(nonatomic,copy) DDButtonMaker *(^normalTitle)(NSString *normalTitle);
/** 设置Highlighted对应的title */
@property(nonatomic,copy) DDButtonMaker *(^highlightedTitle)(NSString *highlightedTitle);

@property(nonatomic,copy) DDButtonMaker *(^actionBlock)(makerBtActionBlock block);

@end

@interface UIButton (DDMaker)

+(UIButton *)dd_btMake:(void(^)(DDButtonMaker *maker))make;

-(void)maker_actionWithControlEvent:(UIControlEvents )event
                          withBlock:(makerBtActionBlock)block;
-(void)maker_actionWithBlock:(makerBtActionBlock)block;

@end
