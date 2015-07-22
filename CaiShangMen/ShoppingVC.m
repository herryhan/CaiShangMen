//
//  ShoppingVC.m
//  CaiShangMen
//
//  Created by 张宇航 on 15/7/15.
//  Copyright (c) 2015年 herryhan. All rights reserved.
//

#import "ShoppingVC.h"
#import "ShopTableViewCell.h"

@interface ShoppingVC () <UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_dataArr;
    UITableView *_tableView;
}
@end

@implementation ShoppingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    float systemVersion = [[[UIDevice currentDevice]systemVersion] floatValue];
    if (systemVersion >= 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
         self.automaticallyAdjustsScrollViewInsets = NO;
        
    }
    self.title = @"购物车";
    _dataArr = [NSArray arrayWithObjects:@"大",@"中",@"小", nil];
   //  _dataArr = [NSArray arrayWithObjects:nil];
    [self  addAllControl];
    
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




-(void)addAllControl
{
    if (_dataArr.count == 0) {
        [self carIsEmpty];
    }
    else
    {
        [self carIsNoEmpty];
    }
}

-(void)carIsEmpty
{
   
    UIImageView *car = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 150, 150)];
    car.center = CGPointMake(self.view.center.x, self.view.center.y - 50);
    car.image =[UIImage imageNamed:@"shoppingcar@2x"];
    [self.view addSubview:car];
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(car.frame.origin.x , car.frame.origin.y + car.frame.size.height +10, 200, 20)];
    label.text = @"亲,你忙吗?我一点点";
    [label sizeToFit];
    
    label.center = CGPointMake(self.view.frame.size.width/2, label.center.y);
    [self.view addSubview:label];
    
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor colorWithRed:0.13 green:0.73 blue:0.47 alpha:1];
    btn.frame = CGRectMake(0, label.frame.origin.y + label.frame.size.height +10, 100, 35);
    [btn setTitle:@"去逛逛" forState: UIControlStateNormal];
    btn.center = CGPointMake(self.view.frame.size.width/2, btn.center.y);
    btn.layer.cornerRadius = 6;
    [self.view addSubview:btn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)carIsNoEmpty
{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 44 -64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
   //_tableView.backgroundColor =[UIColor redColor];
    //self.automaticallyAdjustsScrollViewInsets = false;
    [self.view addSubview:_tableView];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"计算分组数");
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"计算每组(组%li)行数",(long)section);
    
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSIndexPath是一个结构体，记录了组和行信息
    NSLog(@"生成单元格(组：%li,行%li)",(long)indexPath.section,(long)indexPath.row);
    static NSString *cellID = @"cellID";
    
    ShopTableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
       // cell = [[[NSBundle mainBundle]loadNibNamed:@"ShopTableViewCell" owner:self options:nil] lastObject];
        cell = [[ShopTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    
    }
//    [cell.checkBox setBackgroundImage:[UIImage imageNamed:@"choice@2x"] forState:UIControlStateNormal];
//    [cell.Delete setBackgroundImage:[UIImage imageNamed:@"clean@2x"] forState:UIControlStateNormal];
//    cell.VegImage.backgroundColor = [UIColor redColor];
   // cell.textLabel.text=[NSString stringWithFormat:@"%ld行",(long)indexPath.row];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}



- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
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
