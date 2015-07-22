//
//  MineVC.m
//  CaiShangMen
//
//  Created by 张宇航 on 15/7/15.
//  Copyright (c) 2015年 herryhan. All rights reserved.
//

#import "MineVC.h"

@interface MineVC ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tabelView;
    NSArray *_titleArray;
}

@end

@implementation MineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    _titleArray=[NSArray arrayWithObjects:@"1",@"",@"2",@"",@"3",@"4",@"",@"5",@"6", nil];
    [self createTB];
    
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    [self.navigationController setNavigationBarHidden:NO];
    
    //修改导航栏背景--》透明
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg1"]
                                                  forBarMetrics:UIBarMetricsDefault];
    // self.navigationController.navigationBar.shadowImage = [UIImage new];
    //self.navigationController.navigationBar.translucent = YES;
    
}
-(void)createTB
{
    _tabelView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 360) style:UITableViewStylePlain];
    //_tabelView.backgroundColor = [UIColor yellowColor];
    _tabelView.delegate =self;
    _tabelView.dataSource =self;
    _tabelView.tableHeaderView.backgroundColor = [UIColor redColor];
    [_tabelView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
     [_tabelView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    _tabelView.scrollEnabled = NO;
    [self.view addSubview:_tabelView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 //   NSLog(@"计算每组(组%li)行数",(long)section);
    
    return _titleArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSIndexPath是一个结构体，记录了组和行信息
    //NSLog(@"生成单元格(组：%li,行%li)",(long)indexPath.section,(long)indexPath.row);
    static NSString *cellID = @"cellID";
    
    UITableViewCell *cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];

    
    if (indexPath.row == 1 || indexPath.row == 3 || indexPath.row == 6) {
        cell.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1];
        cell.userInteractionEnabled = NO;
    }
    else{
        if (indexPath.row == 0) {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, cell.textLabel.frame.origin.y, [UIImage imageNamed:@"getin@3x"].size.width, [UIImage imageNamed:@"getin@3x"].size.height)];
            imageView.image = [UIImage imageNamed:@"getin@3x"];
            imageView.center = CGPointMake(cell.frame.size.width - cell.frame.size.height/2 +40, 40);
            [cell.contentView addSubview:imageView];
            [cell setLayoutMargins:UIEdgeInsetsZero];
        }
        else
        {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, cell.textLabel.frame.origin.y, [UIImage imageNamed:@"getin@3x"].size.width, [UIImage imageNamed:@"getin@3x"].size.height)];
            imageView.image = [UIImage imageNamed:@"getin@3x"];
            imageView.center = CGPointMake(cell.frame.size.width - cell.frame.size.height/2  +40, 20);
            [cell.contentView addSubview:imageView];
            [cell setLayoutMargins:UIEdgeInsetsZero];
        }
       
    }
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
   // imageView.backgroundColor = [UIColor redColor];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    switch (indexPath.row) {
        case 0:
            [cell.contentView addSubview:imageView];
            [cell.contentView addSubview:label];
            label.frame = CGRectMake(imageView.frame.origin.x + imageView.frame.size.width +10, 10, 100, 20);
            label.text = @"注册 / 登录";
            label.center = CGPointMake(label.center.x, 30);
            imageView.center = CGPointMake(40, 40);
            imageView.image = [UIImage imageNamed:@"head@2x"];
            
            [cell.contentView addSubview:label2];
            label2.frame = CGRectMake(imageView.frame.origin.x + imageView.frame.size.width +10, label.frame.origin.y +label.frame.size.height +3, 100, 20);
            label2.text = @"登录之后享更多优惠";
            [label2 sizeToFit];
            break;
            
        case 2:
            [cell.contentView addSubview:imageView];
            imageView.center = CGPointMake(30, 25);
            imageView.bounds =CGRectMake(0, 0, 30, 30);
            imageView.image = [UIImage imageNamed:@"discount@2x"];
            [cell.contentView addSubview:label];
            label.frame = CGRectMake(imageView.frame.origin.x + imageView.frame.size.width +10, 10, 100, 25);
            label.text = @"优惠劵";
            label.center = CGPointMake(label.center.x, 25);
            break;

        case 4:
            [cell.contentView addSubview:imageView];
            imageView.center = CGPointMake(30, 25);
            imageView.bounds =CGRectMake(0, 0, 30, 30);
            imageView.image = [UIImage imageNamed:@"phone@2x"];
            
            [cell.contentView addSubview:label];
            label.frame = CGRectMake(imageView.frame.origin.x + imageView.frame.size.width +10, 10, 100, 25);
            label.text = @"客服电话";
            label.center = CGPointMake(label.center.x, 25);

            break;

        case 5:
            [cell.contentView addSubview:imageView];
            imageView.center = CGPointMake(30, 25);
            imageView.bounds =CGRectMake(0, 0, 30, 30);
            imageView.image = [UIImage imageNamed:@"suggest@2x"];
            [cell.contentView addSubview:label];
            label.frame = CGRectMake(imageView.frame.origin.x + imageView.frame.size.width +10, 10, 100, 25);
            label.text = @"意见反馈";
            label.center = CGPointMake(label.center.x, 25);

            break;

        case 7:
            [cell.contentView addSubview:imageView];
            imageView.center = CGPointMake(30, 25);
            imageView.bounds =CGRectMake(0, 0, 30, 30);
            imageView.image = [UIImage imageNamed:@"Clear@2x"];
            [cell.contentView addSubview:label];
            label.frame = CGRectMake(imageView.frame.origin.x + imageView.frame.size.width +10, 10, 100, 25);
            label.text = @"清除缓存";
            label.center = CGPointMake(label.center.x, 25);

            break;

        case 8:
            [cell.contentView addSubview:imageView];
            imageView.center = CGPointMake(30, 25);
            imageView.bounds =CGRectMake(0, 0, 30, 30);
            imageView.image = [UIImage imageNamed:@"about@2x"];
            
            [cell.contentView addSubview:label];
            label.frame = CGRectMake(imageView.frame.origin.x + imageView.frame.size.width +10, 10, 100, 25);
            label.text = @"关于菜上门";
            label.center = CGPointMake(label.center.x, 25);

            break;

        default:
            break;
    }
    NSLog(@"%f",cell.frame.size.height);
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 80;
    }
    if (indexPath.row == 1) {
        return 10;
    }
    if (indexPath.row == 3) {
        return 10;
    }
    if (indexPath.row == 6) {
        return 10;
    }
    return 50;
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
