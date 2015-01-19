//
//  ViewController.m
//  JamalCycleScrollView
//
//  Created by jamalping on 15-1-19.
//  Copyright (c) 2015年 jamalping. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *imgStrs = @[@"title_hd1@2x",@"title_hd2@2x"];
    
    NSMutableArray *viewsArray = [NSMutableArray array];
    for (NSString *imgStr in imgStrs) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        imgView.image = [UIImage imageNamed:imgStr];
        [viewsArray addObject:imgView];
    }
    
    self.cycleScrollView = [[CycleScrollView alloc] initWithFrame:self.view.bounds animationDuration:3];
    
    self.cycleScrollView.fetchContentViewAtIndex = ^UIView *(NSInteger pageIndex){
        return viewsArray[pageIndex];
    };
    self.cycleScrollView.totalPagesCount = ^NSInteger(void){
        return imgStrs.count;
    };
    
    self.cycleScrollView.TapActionBlock = ^(NSInteger pageIndex){
        NSLog(@"点击了第%d个",(int)pageIndex);
    };
    [self.view addSubview:self.cycleScrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
