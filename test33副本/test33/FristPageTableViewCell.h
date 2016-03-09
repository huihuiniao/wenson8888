//
//  FristPageTableViewCell.h
//  EasyGou
//
//  Created by lanou on 16/3/3.
//  Copyright © 2016年 黄红荫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FristPage.h"
@interface FristPageTableViewCell : UITableViewCell


//@property (strong, nonatomic) IBOutlet UIImageView *imageV;
//
//@property (strong, nonatomic) IBOutlet UILabel *NameLab;
//@property (strong, nonatomic) IBOutlet UILabel *RangeLab;
//@property (strong, nonatomic) IBOutlet UILabel *PriceLab;
//@property (strong, nonatomic) IBOutlet UILabel *ValueLab;
//@property (strong, nonatomic) IBOutlet UILabel *soldsLab;



@property (strong, nonatomic) IBOutlet UILabel *descL;

@property (strong, nonatomic) IBOutlet UIImageView *imageV;
@property (strong, nonatomic) IBOutlet UILabel *share_urlL;



@property(nonatomic,strong)FristPage *frist ;

@end
