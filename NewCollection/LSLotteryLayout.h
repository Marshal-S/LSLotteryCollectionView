//
//  LSLotteryLayout.h
//  NewCollection
//
//  Created by Marshal on 2017/10/26.
//  Copyright © 2017年 Marshal. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSLotteryLayout;

@protocol LSLotteryLayoutDelegate <NSObject>

@required

- (CGFloat)heightWithLotteryLayout:(LSLotteryLayout *)lotteryLayout section:(NSInteger)section;//返回当前行cell的高度

- (CGFloat)widthWithLotteryLayout:(LSLotteryLayout *)lotteryLayout indexPath:(NSIndexPath *)indexPath;//返回每当前行对应位置的cell的宽度, 每一行的高度是一样的，注意了


@end

@interface LSLotteryLayout : UICollectionViewLayout

@property (nonatomic, weak) id<LSLotteryLayoutDelegate> delegate;

@property (nonatomic, assign) CGFloat columnMargin;//列间距,即cell与cell之间的横向距离,默认为10

@property (nonatomic, assign) CGFloat rowMargin;//行间距,即cell与cell之间的纵向距离，默认为10

@property (nonatomic, assign) UIEdgeInsets edgeIndsets;//边缘间距默认为10

@end
