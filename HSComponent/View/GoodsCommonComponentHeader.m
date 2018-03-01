//
//  GoodsCommonComponentHeader.m
//  JX
//
//  Created by Hanser on 05/12/2017.
//  Copyright © 2017 ZeSong. All rights reserved.
//

#import "GoodsCommonComponentHeader.h"
#import "GoodsComments.h"

@implementation GoodsCommonComponentHeader

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.imageView];
        [self addSubview:self.reviewCountLabel];
    }
    return self;
}

- (UILabel *)titleLabel {
    if (_titleLabel) {
        return _titleLabel;
    }
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = [UIFont boldSystemFontOfSize:17];
//    _titleLabel.textColor = [UIColor colorFromHexCode:@"#212121"];
    _titleLabel.text = @"用户评价";
//    _titleLabel.frame = CGRectMake(15, 0, ScreenWidth - 5, self.height);
    return _titleLabel;
}

- (UIImageView *)imageView {
    if (_imageView) {
        return _imageView;
    }
    _imageView = [[UIImageView alloc] init];
    _imageView.image = [UIImage imageNamed:@"profile_icon_arrow_right"];
    [_imageView sizeToFit];
//    _imageView.origin = CGPointMake(ScreenWidth - 30, 0);
//    _imageView.centerY = self.centerY;
    return _imageView;
}

- (UILabel *)reviewCountLabel {
    if (_reviewCountLabel) {
        return _reviewCountLabel;
    }
    _reviewCountLabel = [[UILabel alloc] init];
    _reviewCountLabel.font = [UIFont systemFontOfSize:13];
//    _reviewCountLabel.textColor = [UIColor colorFromHexCode:@"#757575"];
    _reviewCountLabel.textAlignment = NSTextAlignmentRight;
    return _reviewCountLabel;
}

- (void)setCommentSummary:(CommentSummary *)commentSummary {
    self.reviewCountLabel.text = [NSString stringWithFormat:@"%ld条评价",commentSummary.total];
    [self.reviewCountLabel sizeToFit];
//    self.reviewCountLabel.origin = CGPointMake(_imageView.origin.x - _reviewCountLabel.width, 0);
//    _reviewCountLabel.centerY = self.centerY;
    
//    self.imageView.centerY = self.centerY;
//    self.titleLabel.centerY = self.centerY;
}


@end
