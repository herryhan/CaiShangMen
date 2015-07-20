//
//  NTViewController.m
//  CaiShangMen
//
//  Created by 张宇航 on 15/7/15.
//  Copyright (c) 2015年 herryhan. All rights reserved.
//

#import "NTViewController.h"
#import "MarketVC.h"
#import "ShoppingVC.h"
#import "OrderVC.h"
#import "MineVC.h"
#import "NTButton.h"
#import "BaseNavigationController.h"


@interface NTViewController ()
{
    UIImageView *_tabBarview;
    NTButton *_previousBtn;//先前的按钮

}

@end

@implementation NTViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //wsq
    for (UIView* obj in self.tabBar.subviews) {
        if (obj != _tabBarview) {//_tabBarView 应该单独封装。
            [obj removeFromSuperview];
        }
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tabBarview = [[UIImageView alloc]initWithFrame:self.tabBar.bounds];
    _tabBarview.userInteractionEnabled=YES;
    _tabBarview.backgroundColor=[UIColor whiteColor];
    [self.tabBar addSubview:_tabBarview];
    
    MarketVC *first=[[MarketVC alloc]init];
    first.delegate=self;
    //
    UINavigationController *navi1=[[UINavigationController alloc]initWithRootViewController:first];
    ShoppingVC *second=[[ShoppingVC alloc]init];
    UINavigationController *navi2=[[UINavigationController alloc]initWithRootViewController:second];
    OrderVC *third=[[OrderVC alloc]init];
    UINavigationController *navi3=[[UINavigationController alloc]initWithRootViewController:third];
    MineVC *fourth=[[MineVC alloc]init];
    UINavigationController *navi4=[[UINavigationController alloc]initWithRootViewController:fourth];
    self.viewControllers=[NSArray arrayWithObjects:navi1,navi2,navi3, navi4,nil];
    [self creatBUttonWithNormalName:@"market@2x" andSelectName:@"market_select@2x" andTitle:@"菜市场" andIndex:0];
    [self creatBUttonWithNormalName:@"shopping@2x" andSelectName:@"shopping_select@2x" andTitle:@"购物车" andIndex:1];
    [self creatBUttonWithNormalName:@"menu@2x" andSelectName:@"menu_select@2x" andTitle:@"订单" andIndex:2];
    [self creatBUttonWithNormalName:@"mine@2x" andSelectName:@"mine_select@2x" andTitle:@"我的" andIndex:3];
    
    NTButton * button = _tabBarview.subviews[0];
    [self changeViewController:button];
    
    
    
}
#pragma mark 创建一个按钮
-(void)creatBUttonWithNormalName:(NSString *)normal andSelectName:(NSString *)selected andTitle:(NSString *)title andIndex:(int)index{
    NTButton *customButton=[NTButton buttonWithType:UIButtonTypeCustom];
    customButton.tag=index;
    CGFloat buttonW=_tabBarview.frame.size.width/4;
    CGFloat buttonH=_tabBarview.frame.size.height;
    
    customButton.frame=CGRectMake(90*index, 0, buttonW, buttonH);
    [customButton setImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    [customButton  setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    //设置选中状态的图片
    [customButton setImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];
    [customButton setTitle:title forState:UIControlStateNormal];
    [customButton  setTitleColor:[UIColor colorWithRed:0.05f green:0.7f blue:0.5f alpha:1.0] forState:UIControlStateSelected];//?
    
    [customButton addTarget:self action:@selector(changeViewController:) forControlEvents:UIControlEventTouchDown];
    
    customButton.imageView.contentMode = UIViewContentModeCenter;
    customButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    customButton.titleLabel.font = [UIFont systemFontOfSize:10];
    
    
    [_tabBarview addSubview:customButton];
    
    if(index == 0)//设置第一个选择项。
    {
        _previousBtn = customButton;
        _previousBtn.selected =YES;
    }
    
    
    
}
#pragma mark 按钮被点击时
-(void)changeViewController:(NTButton *)sender
{
    if(self.selectedIndex != sender.tag){ //wsq®
        self.selectedIndex = sender.tag; //切换不同控制器的界面
        _previousBtn.selected = ! _previousBtn.selected;
        _previousBtn = sender;
        _previousBtn.selected = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
