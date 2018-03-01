//
//  GoodsComments.m
//  JX
//
//  Created by Hanser on 05/12/2017.
//  Copyright © 2017 ZeSong. All rights reserved.
//

#import "GoodsComments.h"

@implementation CommentInfo

@end

@implementation CommentSummary
+ (id)infoList_class {
    return [CommentInfo class];
}

@end

@implementation Comments

+ (id)replies_class {
    return [Comments class];
}


@end


@implementation GoodsComments

+ (id)comments_class {
    return [Comments class];
}

- (CGFloat)headerHeight {
    return 60;
}
- (CGFloat)bodyHeight {
    return 155;
}

- (CGFloat)heigt {
    return ([self bodyHeight] + [self headerHeight]);
}


- (CGFloat)cellHeight {
    return [self heigt];
}


@end
