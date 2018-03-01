//
//  GoodsCommonComponentBody.m
//  JX
//
//  Created by Hanser on 05/12/2017.
//  Copyright © 2017 ZeSong. All rights reserved.
//

#import "GoodsCommonComponentBody.h"
#import "GoodsCommonComponentLayout.h"
#import "GDAppraiseCollectionCell.h"

NSString * const kAppraiseCollectionCellID = @"GDAppraiseCollectionCell";

@interface GoodsCommonComponentBody()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) GoodsCommonComponentLayout *collectionViewLayout;
@property (nonatomic, assign) CGFloat lastContentX;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation GoodsCommonComponentBody

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.collectionView];
    }
    return self;
}

- (void)setComments:(NSArray<Comments *> *)comments {
    _comments = comments;
    [_collectionView reloadData];
    if (comments.count > 1) {
//        [self.timer fire];
    }
}


- (UICollectionView *)collectionView {
    if (_collectionView) {
        return _collectionView;
    }
//    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height) collectionViewLayout:self.collectionViewLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.clipsToBounds = NO;
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [_collectionView registerNib:[UINib nibWithNibName:kAppraiseCollectionCellID bundle:nil] forCellWithReuseIdentifier:kAppraiseCollectionCellID];
    return _collectionView;
}

- (GoodsCommonComponentLayout *)collectionViewLayout {
    if (_collectionView) {
        return _collectionViewLayout;
    }
    _collectionViewLayout = [[GoodsCommonComponentLayout alloc] init];
    _collectionViewLayout.minimumLineSpacing = 15;
    _collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _collectionViewLayout.sectionInset = UIEdgeInsetsMake(0, 15, 15, 0);
//    if (ScreenWidth < 375) {
////        _collectionViewLayout.itemSize = CGSizeMake(AdaptatSize(310), AdaptatSize(140));
//    }else {
//        _collectionViewLayout.itemSize = CGSizeMake(310,140);
//    }
    return _collectionViewLayout;
}

- (NSTimer *)timer {
    if (_timer) {
        return _timer;
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(timeDidFird:) userInfo:nil repeats:YES];
    return _timer;
}

- (void)timeDidFird:(NSTimer *)timer {
    NSInteger currentPage = [self currentPage];
    if (currentPage == _comments.count - 1) {
        [self scrollToPage:0 animated:YES];
    }else {
        [self scrollToPage:currentPage + 1 animated:YES];
    }
}

#pragma mark - UICollectionViewDelegate && UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _comments.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GDAppraiseCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kAppraiseCollectionCellID forIndexPath:indexPath];
    [cell layoutIfNeeded];
    [cell setNeedsLayout];
    Comments *comment = [_comments objectAtIndex:indexPath.row];
    [cell update:comment];
    //    cell.label.text = [NSString stringWithFormat:@"item: %ld", (long)indexPath.item];
//    NSInteger realIndex = indexPath.item % _realCount;
//    PictureInfo *info = [_goodsInfo.images objectAtIndex:realIndex];
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:info.pictureUrl] placeholderImage:nil];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([_delegate respondsToSelector:@selector(collectionView:didSelectAtIndex:)]) {
        [_delegate collectionView:collectionView didSelectAtIndex:indexPath];
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
//    [self scrollViewDidEndDecelerating:scrollView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
}


#pragma mark - other
//- (void)setFrame:(CGRect)frame {
//    [super setFrame:frame];
//}

- (void)scrollToPage:(NSInteger)page animated:(BOOL)animated
{
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)_collectionView.collectionViewLayout;
    CGFloat offsetX = (layout.itemSize.width + layout.minimumLineSpacing) * page;
    [_collectionView setContentOffset:CGPointMake(offsetX , 0) animated:animated];
}

- (NSInteger)currentPage
{
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)_collectionView.collectionViewLayout;
    NSInteger pageNum = (_collectionView.contentOffset.x) / (layout.itemSize.width + layout.minimumLineSpacing);
    return pageNum;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.collectionView.frame = self.bounds;
    self.collectionView.bounds = self.bounds;
}

- (NSInteger)scrollAtIndex:(CGFloat)offsetX {
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)_collectionView.collectionViewLayout;
    CGFloat itemWidth = layout.itemSize.width + layout.minimumLineSpacing;
    NSInteger index = offsetX / itemWidth;
    return index;
}

- (void)dealloc {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}



@end
