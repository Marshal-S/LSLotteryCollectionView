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
        _lblText = [[UILabel alloc] initWithFrame:self.bounds];
        _lblText.textColor = [UIColor whiteColor];
        _lblText.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_lblText];
//        self.contentView.layer.cornerRadius = 40;
//        _lblText.layer.cornerRadius = 40;
    }
    return self;
}


@end
