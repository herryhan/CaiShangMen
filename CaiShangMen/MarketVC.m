//
//  MarketVC.m
//  CaiShangMen
//
//  Created by 张宇航 on 15/7/15.
//  Copyright (c) 2015年 herryhan. All rights reserved.
//

#import "MarketVC.h"

@interface MarketVC () <UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tabelView;
}

@end

@implementation MarketVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"菜篮子";
    [self createscrollview];
    [self config];
    
}
-(void)createscrollview
{
    UIScrollView *sv=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64,self.view.bounds.size.width , 120)];
    sv.contentSize=CGSizeMake((self.view.bounds.size.width)*3, 120);
    sv.pagingEnabled=YES;
    sv.backgroundColor=[UIColor yellowColor];
    sv.alwaysBounceHorizontal=YES;
    
    //
    sv.contentOffset=CGPointMake(self.view.bounds.size.width, 0);
    [self.view addSubview:sv];
//    for (int i=0; i<3; i++) {
//        UIImageView *imageView=[[UIImageView alloc]init];
//       // imageView.frame=CGRectMake(i*, 0, 250, 220);
//        imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"",i+1]];
//        [sv addSubview:imageView];
 //   }
  
}
-(void)config
{

    NSArray *imageArr = [NSArray arrayWithObjects:@"host@3x",@"vegetables@3x",@"meet@3x",@"oil@3x",nil];
    NSArray *titleArr = [NSArray arrayWithObjects:@"热门",@"蔬菜",@"鲜肉",@"粮食",nil];
    for (int i =0; i<imageArr.count; i++) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake((self.view.bounds.size.width) /4 *i, 184, (self.view.bounds.size.width) /4, 80 +20)];
        
        [self.view addSubview:view];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, (self.view.bounds.size.width) /4, 80);
        [btn setImage:[UIImage imageNamed:imageArr[i]] forState:UIControlStateNormal];
        [view addSubview:btn];
        
    
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 65, (self.view.bounds.size.width) /4, 20)];
        label.textAlignment = NSTextAlignmentCenter;
        
        label.text = titleArr[i];
        
        [view addSubview:label];
        
    }
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 184+100, self.view.frame.size.width, 10)];
    view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:view];
    
    [self createTB];
    
}


-(void)createTB
{
    _tabelView =[[UITableView alloc]initWithFrame:CGRectMake(0, 294, self.view.frame.size.width, self.view.frame.size.height - 294 - 40) style:UITableViewStylePlain];
    _tabelView.backgroundColor = [UIColor yellowColor];
    _tabelView.delegate =self;
    _tabelView.dataSource =self;
    [self.view addSubview:_tabelView];
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
   
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        NSArray *nib =[[NSBundle mainBundle]loadNibNamed:@"HomeTableViewCell" owner:self options:nil];
        cell = [nib lastObject];
        
    }
    
    //cell.textLabel.text=[NSString stringWithFormat:@"%ld行",(long)indexPath.row];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
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
