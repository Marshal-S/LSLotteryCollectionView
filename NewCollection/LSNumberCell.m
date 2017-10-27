//
//  LSNumberCell.m
//  NewCollection
//
//  Created by Marshal on 2017/10/26.
//  Copyright © 2017年 Marshal. All rights reserved.
//

#import "LSNumberCell.h"

@implementation LSNumberCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor redColor];
        _lblText = [[UILabel alloc] init];
        _lblText.textColor = [UIColor whiteColor];
        _lblText.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_lblText];
    }
    return self;
}

//记得在这里更新内部布局frame呀呀
- (void)updateText:(NSString *)text {
    _lblText.frame = self.bounds;
    _lblText.text = text;
}

@end
