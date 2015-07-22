//
//  ShopTableViewCell.m
//  CaiShangMen
//
//  Created by yzx on 15/7/21.
//  Copyright (c) 2015年 herryhan. All rights reserved.
//

#import "ShopTableViewCell.h"

@implementation ShopTableViewCell
{
    UILabel *_label1;
    UILabel *_label2;
    UIImageView *VegImage;
    UIButton *checkBox;
    UIImageView *DeleteImage;
    UIView *view;
    
    UIButton *plusBtn;
    UIButton *minusBtn;
    UILabel *numLabel;
    
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       
        
        checkBox = [UIButton buttonWithType:UIButtonTypeCustom];
        checkBox.frame = CGRectMake(10, 30, 20, 20);
        [checkBox setBackgroundImage:[UIImage imageNamed:@"choice@2x"] forState:UIControlStateNormal];
        [self.contentView addSubview:checkBox];
        
        VegImage =[[UIImageView alloc]initWithFrame:CGRectMake(checkBox.frame.origin.x + 20 +30, 20, 80, 80)];
        VegImage.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:VegImage];
        
        
        _label1 = [[UILabel alloc] initWithFrame:CGRectMake(VegImage.frame.origin.x + VegImage.frame.size.width + 20, 25, 160, 10)];
        _label1.text = @"菜名";
        [self.contentView addSubview:_label1];
        
        _label2 = [[UILabel alloc] initWithFrame:CGRectMake(_label1.frame.origin.x, _label1.frame.origin.y +_label1.frame.size.height +15 , 160, 10)];
        _label2.text = @"价格";
        [self.contentView addSubview:_label2];
        
        
        DeleteImage =[[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width , VegImage.frame.origin.y +VegImage.frame.size.height - 30 , 30, 35)];
        DeleteImage.image = [UIImage imageNamed:@"clean@2x"];
        [self.contentView addSubview:DeleteImage];
        
        view = [[UIView alloc]initWithFrame:CGRectMake(_label1.frame.origin.x, VegImage.frame.origin.y + VegImage.frame.size.height - 30, 120, 30)];
        view.backgroundColor = [UIColor grayColor];
        view.layer.borderWidth = 1;
        view.layer.borderColor = [UIColor colorWithRed:0.91 green:0.91 blue:0.91 alpha:1].CGColor;
        [self.contentView addSubview:view];
        
        plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        plusBtn.frame = CGRectMake(0, 0, 30, 30);
        [plusBtn setImage: [UIImage imageNamed:@"gift_numberplus@2x"] forState:UIControlStateNormal];
        [view addSubview:plusBtn];
        
        minusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        minusBtn.frame = CGRectMake(view.frame.size.width - 30, 0, 30, 30);
        [minusBtn setImage: [UIImage imageNamed:@"gift_numberminus@2x"] forState:UIControlStateNormal];
        minusBtn.backgroundColor = [UIColor clearColor];
       // minusBtn.backgroundColor = [UIColor redColor];
        [view addSubview:minusBtn];
        
        numLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 0, view.frame.size.width -60, 30)];
        numLabel.text = @"1";
        numLabel.textAlignment = NSTextAlignmentCenter;
        numLabel.backgroundColor = [UIColor whiteColor];
        [view addSubview:numLabel];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
