//
//  LSNumberCell.h
//  NewCollection
//
//  Created by Marshal on 2017/10/26.
//  Copyright © 2017年 Marshal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSNumberCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *lblText;

//记得在这里更新内部布局frame呀呀
- (void)updateText:(NSString *)text;

@end
