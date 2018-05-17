//
//  ViewController.m
//  DDMakerExample
//
//  Created by wl on 2018/5/17.
//  Copyright © 2018年 wl. All rights reserved.
//

#import "ViewController.h"
#import "DDMaker.h"

@interface ViewController ()
@property (nonatomic,weak) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self ddMaker];
}
-(void)ddMaker
{
    self.label = [UILabel dd_lbMake:^(DDLabelMaker *maker) {
        maker.bgColor([UIColor redColor]).textAlignment(NSTextAlignmentCenter).intoView(self.view).numberOfLines(0);
        maker.textColor([UIColor purpleColor]).boldFontSize(25).frame(CGRectMake(10, 80, 300, 110));
        maker.attributedText([NSMutableAttributedString dd_attributedStringMake:^(DDMutAttributedStringMaker *maker) {
            maker.textColor([UIColor yellowColor]).font([UIFont boldSystemFontOfSize:16]).fontRange([UIFont systemFontOfSize:28], [@"今年" rangeOfString:@"今年"]);
            maker.kern(@4).lineSpacing(10);
            //            maker.specialTextSet(@[@"笑",@"江湖"], @[[UIFont systemFontOfSize:16],[UIFont boldSystemFontOfSize:30]], @[[UIColor cyanColor],[UIColor orangeColor]]);
            maker.specialText(@"江湖", [UIFont systemFontOfSize:16], [UIColor blueColor]);
        } str:@"关于今年新 iPhone 的消息我们已经听到不少，比如传闻中的第二代 iPhone SE，还有配备更大尺寸屏幕的 iPhone X Plus，但这次的新消息则是和充电头有关。来自国外的 ChargerLab 近期曝光了几张疑似是今年新 iPhone 充电头的设计图，它不仅会换用新的 USB Type-C 接口，还会支持 18W 的快充。"]);
    }];
    NSLog(@"%@",self.label.text);
    
    
    //button的创建
    [UIButton dd_btMake:^(DDButtonMaker *maker) {
        maker.intoView(self.view).bgColor([UIColor orangeColor]).frame(CGRectMake(10, 200, 260, 40));
        maker.normalTitle(@"点击一下试试").normalTitleColor([UIColor purpleColor]);
        maker.highlightedTitle(@"高亮了").highlightedTitleColor([UIColor cyanColor]);
        maker.actionBlock(^{
            NSLog(@"单击了button");
        });
        maker.intoView(self.view);
    }];
    //imageView的创建
    [UIImageView dd_imgVMake:^(DDImageViewMaker *maker) {
        maker.intoView(self.view).frame(CGRectMake(10, 260, 80, 80));
        maker.imageName(@"1024");
    }];
    //UIView的创建
    [UIView dd_viewMake:^(DDViewMaker *maker) {
        maker.intoView(self.view).frame(CGRectMake(20, 360, 40, 40));
        maker.bgColor([UIColor yellowColor]);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
