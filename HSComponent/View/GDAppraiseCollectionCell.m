//
//  GDAppraiseCollectionCell.m
//  JX
//
//  Created by Hanser on 06/12/2017.
//  Copyright © 2017 Shanghai Mengdian Information Technology Co., Ltd. All rights reserved.
//

#import "GDAppraiseCollectionCell.h"
#import "GoodsComments.h"

@interface GDAppraiseCollectionCell()

@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *repliesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *commentImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageAspect;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *commentImgWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *commentImgHeihgt;
@property (weak, nonatomic) IBOutlet UIView *labelBgView;
@property (weak, nonatomic) IBOutlet UILabel *imageNum;

@end

@implementation GDAppraiseCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _headImg.clipsToBounds = YES;
    
    self.clipsToBounds = NO;
    self.contentView.layer.cornerRadius = 6.0f;
    self.contentView.layer.masksToBounds = YES;
    self.backgroundColor = [UIColor whiteColor];
    
    self.layer.cornerRadius = 6;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeZero;
    self.layer.shadowRadius = 3.0f;
    self.layer.shadowOpacity = 0.2f;
    self.layer.masksToBounds = NO;
    self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.contentView.layer.cornerRadius].CGPath;
}

- (void)update:(id)data {
    Comments *comment = (Comments *)data;
//    [_headImg sd_setImageWithURL:[NSURL URLWithString:comment.headImg]];
    _nameLabel.text = comment.nickname;
    _repliesLabel.attributedText = [self getAttributedStringWithString:comment.content lineSpace:3];
    if (comment.images.count == 0) {
        _commentImgWidth.constant = 0;
        _commentImgHeihgt.constant = 0;
        _labelBgView.hidden = YES;
    }else {
        _labelBgView.hidden = NO;
        _imageNum.text = [NSString stringWithFormat:@"%ld张",comment.images.count];
//        _commentImgWidth.constant = AdaptatSize(140);
//        _commentImgHeihgt.constant = AdaptatSize(140);
//        [_commentImage sd_setImageWithURL:[NSURL URLWithString:[comment.images firstObject]]];
    }
}

- (void)layoutIfNeeded {
    [super layoutIfNeeded];
    
    self.clipsToBounds = NO;
    self.contentView.layer.cornerRadius = 6.0f;
    self.contentView.layer.masksToBounds = YES;
    self.backgroundColor = [UIColor whiteColor];
    
    self.layer.cornerRadius = 6;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeZero;
    self.layer.shadowRadius = 3.0f;
    self.layer.shadowOpacity = 0.2f;
    self.layer.masksToBounds = NO;
    self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.contentView.layer.cornerRadius].CGPath;
}


- (NSAttributedString *)getAttributedStringWithString:(NSString *)string lineSpace:(CGFloat)lineSpace {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpace; // 调整行间距
    NSRange range = NSMakeRange(0, [string length]);
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    return attributedString;
}


@end
