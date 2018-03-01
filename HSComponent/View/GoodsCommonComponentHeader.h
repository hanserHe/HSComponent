//
//  GoodsCommonComponentHeader.h
//  JX
//
//  Created by Hanser on 05/12/2017.
//  Copyright © 2017 ZeSong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CommentSummary;
@interface GoodsCommonComponentHeader : UIView

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *reviewCountLabel;
@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) CommentSummary *commentSummary;


@end
