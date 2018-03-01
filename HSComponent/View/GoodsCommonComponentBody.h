//
//  GoodsCommonComponentBody.h
//  JX
//
//  Created by Hanser on 05/12/2017.
//  Copyright © 2017 ZeSong. All rights reserved.
//

#import <UIKit/UIKit.h>


@class Comments;

@protocol GoodsCommonComponentBodyDelegate<NSObject>

- (void)collectionView:(UICollectionView *)collectionView didSelectAtIndex:(NSIndexPath *)indexPath;

@end

@interface GoodsCommonComponentBody : UIView

@property (nonatomic, strong) NSArray <Comments *>*comments;
@property (nonatomic, weak) id<GoodsCommonComponentBodyDelegate> delegate;

@end
