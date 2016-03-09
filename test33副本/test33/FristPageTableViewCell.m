//
//  FristPageTableViewCell.m
//  EasyGou
//
//  Created by lanou on 16/3/3.
//  Copyright © 2016年 黄红荫. All rights reserved.
//

#import "FristPageTableViewCell.h"
#import "UIImageView+WebCache.h"


#define ScreenW  [UIScreen mainScreen].bounds.size.width
#define ScreenH  [UIScreen mainScreen].bounds.size.height

@implementation FristPageTableViewCell





-(void)setFrist:(FristPage *)frist{
    _frist = frist ;
    //    NSURL *url = [NSURL URLWithString:frist.imgurl];
    //    [self.imageV sd_setImageWithURL:url];
    
    
//    self.NameLab.text = frist.mname ;
//    self.RangeLab.text = [frist.range stringByAppendingString:frist.title];
//    self.RangeLab.numberOfLines = 0 ;
//    self.PriceLab.text = [frist.price stringValue] ;
//    self.ValueLab.text = [@"门市价"stringByAppendingString:[frist.value stringValue] ] ;
//    self.soldsLab.text = [frist.solds stringValue] ;
    self.descL.text = frist.desc ;
     NSURL *url = [NSURL URLWithString:[frist.ori_image valueForKey:@"url"]];
     [self.imageV sd_setImageWithURL:url];
    
    
    
    
    
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
