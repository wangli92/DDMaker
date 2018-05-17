//
//  DDTableViewMaker.h
//  DDMakerExample
//
//  Created by wl on 2018/5/17.
//  Copyright © 2018年 wl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DDTableViewMaker : NSObject
@property(nonatomic,copy) DDTableViewMaker *(^intoView)(UIView *superV);
@property(nonatomic,copy) DDTableViewMaker *(^bgColor)(UIColor *bgColor);
@property(nonatomic,copy) DDTableViewMaker *(^delegate)(id delegate);
/** 去掉所有的分割线 */
@property(nonatomic,copy) DDTableViewMaker *(^hideAllSeparator)(BOOL ishidden);
/** 去掉多余的分割线 */
@property(nonatomic,copy) DDTableViewMaker *(^hideExtraSeparator)(BOOL isHidden);
@end


@interface UITableView (DDMaker)

/**
 * 创建UITableView对象，此处注意，需要frame和isPlain两个参数。
 * 参考`UITableView`的`- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style NS_DESIGNATED_INITIALIZER;`方法，必须指定style。
 * @param isPlain  YES/UITableViewStylePlain , NO/UITableViewStyleGrouped
 */
+(UITableView *)dd_tableVMake:(void(^)(DDTableViewMaker *maker))make
                        frame:(CGRect)frame
                      isPlain:(BOOL)isPlain;

@end
