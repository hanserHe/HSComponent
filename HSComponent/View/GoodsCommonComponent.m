//
//  GoodsComponent.m
//  JX
//
//  Created by Hanser on 05/12/2017.
//  Copyright © 2017 ZeSong. All rights reserved.
//

#import "GoodsCommonComponent.h"
#import "GoodsCommonComponentHeader.h"
#import "GoodsCommonComponentBody.h"
#import "GoodsComments.h"

@interface GoodsCommonComponent()<GoodsCommonComponentBodyDelegate>


@end

@implementation GoodsCommonComponent

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.header];
        [self addSubview:self.body];
    }
    return self;
}

- (GoodsCommonComponentHeader *)header {
    if (_header) {
        return _header;
    }
    _header = [[GoodsCommonComponentHeader alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 60)];
    return _header;
}

- (GoodsCommonComponentBody *)body {
    if (_body) {
        return _body;
    }
//    _body = [[GoodsCommonComponentBody alloc] initWithFrame:CGRectMake(0, _header.size.height, ScreenWidth, self.height - _header.height)];
    _body.delegate = self;
    return _body;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectAtIndex:(NSIndexPath *)indexPath {
    if ([_delegate respondsToSelector:@selector(goodsCommonComponentBody:didAtIndexPath:)]) {
        [_delegate goodsCommonComponentBody:collectionView didAtIndexPath:indexPath];
    }
}

- (void)setGoodsComment:(GoodsComments *)goodsComment {
//    [self setFrame:CGRectMake(0, 0, ScreenWidth, [goodsComment heigt])];
//    [_header setFrame:CGRectMake(0, 0, ScreenWidth, [goodsComment headerHeight])];
//    [_body setFrame:CGRectMake(0, [goodsComment headerHeight], ScreenWidth, [goodsComment bodyHeight])];
//    _body.bounds = CGRectMake(0, 0, ScreenWidth, [goodsComment bodyHeight]);
    _body.comments = goodsComment.comments;
    _header.commentSummary = goodsComment.summary;
    
    if (_goodsComment != goodsComment) {
        //调整自身的frame
    }
}

@end
