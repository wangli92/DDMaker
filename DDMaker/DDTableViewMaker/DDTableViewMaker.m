//
//  DDTableViewMaker.m
//  DDMakerExample
//
//  Created by wl on 2018/5/17.
//  Copyright © 2018年 wl. All rights reserved.
//

#import "DDTableViewMaker.h"
#define DDTableVMakerStrongSelf(type)  __strong typeof(type) type = weak##type;

@interface DDTableViewMaker ()
/** 要创建的UITableView对象 */
@property(nonatomic,strong) UITableView *creatingTableV;
@end


@implementation DDTableViewMaker
-(instancetype)init
{
    self = [super init];
    if (self) {
        
        __weak typeof(self) weakself = self;
        //父视图
        _intoView = ^DDTableViewMaker *(UIView *superV){
            DDTableVMakerStrongSelf(self)
            if (superV) {
                [superV addSubview:self.creatingTableV];
            }
            return self;
        };
        
        //背景色
        _bgColor = ^DDTableViewMaker *(UIColor *color){
            DDTableVMakerStrongSelf(self)
            self.creatingTableV.backgroundColor = color;
            return self;
        };
        
        //代理
        _delegate = ^DDTableViewMaker *(id delegate){
            DDTableVMakerStrongSelf(self)
            self.creatingTableV.delegate = delegate;
            self.creatingTableV.dataSource = delegate;
            return self;
        };
        
        //分割线
        _hideAllSeparator = ^DDTableViewMaker *(BOOL isHidden){
            DDTableVMakerStrongSelf(self)
            if (isHidden) {
                self.creatingTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
            }
            return self;
        };
        _hideExtraSeparator = ^DDTableViewMaker *(BOOL isHidden){
            DDTableVMakerStrongSelf(self)
            if (isHidden) {
                [self.creatingTableV setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
            }
            return self;
        };
    }
    return self;
}
@end

@implementation UITableView (DDMaker)
+(UITableView *)dd_tableVMake:(void (^)(DDTableViewMaker *))make frame:(CGRect)frame isPlain:(BOOL)isPlain
{
    DDTableViewMaker *tableViewMaker = [[DDTableViewMaker alloc]init];
    tableViewMaker.creatingTableV = [[UITableView alloc]initWithFrame:frame style:isPlain?UITableViewStylePlain:UITableViewStyleGrouped];
    if (make) {
        make(tableViewMaker);
    }
    return tableViewMaker.creatingTableV;
}
@end
