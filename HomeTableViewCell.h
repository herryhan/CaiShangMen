//
//  HomeTableViewCell.h
//  CaiShangMen
//
//  Created by yzx on 15/7/20.
//  Copyright (c) 2015年 herryhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
@property (weak, nonatomic) IBOutlet UILabel *vegetableNane;
@property (weak, nonatomic) IBOutlet UILabel *oldPrice;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *numForBuy;

@end
