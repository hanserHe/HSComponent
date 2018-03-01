//
//  GoodsComments.h
//  JX
//
//  Created by Hanser on 05/12/2017.
//  Copyright © 2017 ZeSong. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  为了定义更多的样式控件
 */
typedef NS_ENUM(NSInteger, GoodsCommentsType) {
    GoodsComponentTypeAppaise //评价
};

/**
 *  组件标签
 */
@interface CommentInfo : NSObject

@property (nonatomic, assign) NSInteger isSelect;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger type;    

@end

@interface CommentSummary : NSObject
@property (nonatomic, copy) NSString *iconUrl;                  //图片url
@property (nonatomic, copy) NSString *ratio;                    //好评率
@property (nonatomic, copy) NSString *tips;                     //提示
@property (nonatomic, assign) NSInteger total;                  //总评价数
@property (nonatomic, copy) NSArray <CommentInfo *> *infoList;

@end

/**
 * 评价人信息
 */
@interface Comments : NSObject

@property (nonatomic, copy) NSString *headImg;                      // 头像
@property (nonatomic, copy) NSString *nickname;                     // 昵称
@property (nonatomic, assign) int level;                            // 是否精华
@property (nonatomic, copy) NSString *levelUrl;                     // 精华图片Url
@property (nonatomic, copy) NSString *content;                      // 评论内容
@property (nonatomic, copy) NSString *createTime;                   // 评论时间
@property (nonatomic, copy) NSString *goodsSkuInfo;                 // 商品规格信息
@property (nonatomic, strong) NSArray <NSString *> *images;         // 评论商品图片列表
@property (nonatomic, strong) NSArray <Comments *> *replies;        // 回复评论列表
@property (nonatomic, assign) NSInteger score;                      // 得分


@end



@interface GoodsComments : NSObject

@property (nonatomic, strong) NSArray <Comments *>*comments;
@property (nonatomic, strong) CommentSummary *summary;

- (CGFloat)headerHeight;
- (CGFloat)bodyHeight;
- (CGFloat)heigt;



@end
