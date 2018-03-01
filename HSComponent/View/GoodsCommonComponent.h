//
//  GoodsComponent.h
//  JX
//
//  Created by Hanser on 05/12/2017.
//  Copyright © 2017 ZeSong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GoodsCommonComponentHeader;
@class GoodsCommonComponentBody;
@class GoodsComments;

@protocol GoodsCommonComponentDelegate<NSObject>

- (void)goodsCommonComponentBody:(UICollectionView *)collectionView didAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface GoodsCommonComponent : UIView

@property (nonatomic, strong) GoodsCommonComponentHeader *header;
@property (nonatomic, strong) GoodsCommonComponentBody *body;

@property (nonatomic, strong) GoodsComments *goodsComment;

@property (nonatomic, weak) id<GoodsCommonComponentDelegate> delegate;

@end
