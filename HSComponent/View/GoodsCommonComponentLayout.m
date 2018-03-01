//
//  GoodsCommonComponentLayout.m
//  JX
//
//  Created by Hanser on 06/12/2017.
//  Copyright © 2017 Shanghai Mengdian Information Technology Co., Ltd. All rights reserved.
//

#import "GoodsCommonComponentLayout.h"


#define ACTIVE_DISTANCE 200
#define ZOOM_FACTOR 0.1

@implementation GoodsCommonComponentLayout

- (void)prepareLayout
{
    [super prepareLayout];
}


- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

//-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
//{
//    NSArray* array = [super layoutAttributesForElementsInRect:rect];
//    CGRect visibleRect;
//    visibleRect.origin = self.collectionView.contentOffset;
//    visibleRect.size = self.collectionView.bounds.size;
//
//    for (UICollectionViewLayoutAttributes* attributes in array) {
//        if (CGRectIntersectsRect(attributes.frame, rect)) {
//            CGFloat distance = CGRectGetMidX(visibleRect) - attributes.center.x;
//
//            distance = ABS(distance);
//
//            if (distance < ScreenWidth / 2 + self.itemSize.width) {
//                CGFloat zoom = 1 + ZOOM_FACTOR * (1 - distance / ACTIVE_DISTANCE);
//                attributes.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0);
//                attributes.transform3D = CATransform3DTranslate(attributes.transform3D, 0 , -zoom * 25, 0);
//                attributes.alpha = zoom - ZOOM_FACTOR;
//            }
//
//        }
//    }
//
//    return array;
//}


//- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
//{
//    CGFloat visibleX = proposedContentOffset.x;
//    CGFloat visibleY = proposedContentOffset.y;
//    CGFloat visibleW = self.collectionView.bounds.size.width;
//    CGFloat visibleH = self.collectionView.bounds.size.height;
//    CGRect visibleRect = CGRectMake(visibleX, visibleY, visibleW, visibleH);
//    
//    NSArray<UICollectionViewLayoutAttributes *> *attrs = [super layoutAttributesForElementsInRect:visibleRect];
//    
//    CGFloat centerX = proposedContentOffset.x + self.itemSize.width * 0.5;
//    __block NSUInteger itemIndex = 0;
//    __block CGFloat distance = ABS([attrs objectAtIndex:0].center.x - centerX);
//    
//    [attrs enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes *attr, NSUInteger idx, BOOL * _Nonnull stop) {
//        if (ABS(attr.center.x - centerX) < distance) {
//            distance = ABS(attr.center.x - centerX);
//            itemIndex = idx;
//        }
//    }];
//    
//    if (distance == -1) {
//        return proposedContentOffset;
//    } else {
//        // > 0 obj在右边, < 0 obj在左边
//        distance = [attrs objectAtIndex:itemIndex].center.x - centerX;
//        return CGPointMake(proposedContentOffset.x + distance - 15, proposedContentOffset.y);
//    }
//}



@end
