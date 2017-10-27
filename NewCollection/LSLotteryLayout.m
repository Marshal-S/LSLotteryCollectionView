//
//  QYLLotteryLayout.m
//  NewCollection
//
//  Created by Marshal on 2017/10/26.
//  Copyright © 2017年 Marshal. All rights reserved.
//

#import "LSLotteryLayout.h"

static const UIEdgeInsets defaultEdgeInsets = {10, 10, 10, 10};

@interface LSLotteryLayout ()
{
    CGFloat _maxWidth;//最大宽度
    CGFloat _maxHeight;//最大高度
}
@property (nonatomic, strong) NSMutableArray *attrAry;//属性数组

@end

@implementation LSLotteryLayout

- (instancetype)init {
    if (self = [super init]) {
        _attrAry = [NSMutableArray array];
    }
    return self;
}

- (void)prepareLayout {
    [super prepareLayout];
    _edgeIndsets = UIEdgeInsetsEqualToEdgeInsets(_edgeIndsets, UIEdgeInsetsZero) ? defaultEdgeInsets : _edgeIndsets;
    _columnMargin = _columnMargin > 0 ? _columnMargin : 10;//默认每行cell高度为4
    _rowMargin = _rowMargin > 0 ? _rowMargin : 10;
    _maxHeight = _edgeIndsets.top;
    _maxWidth = _edgeIndsets.left;
    
    NSInteger sections = [self.collectionView numberOfSections];//返回总行数
    for (NSInteger i = 0; i < sections; i++) {
        NSInteger count = [self.collectionView numberOfItemsInSection:i];//获取每一行的cell属相
        CGFloat cellHeight = [_delegate heightWithLotteryLayout:self section:i];//获取高度
        CGFloat cellWidth = _edgeIndsets.left;
        if (_maxHeight > _edgeIndsets.top) _maxHeight += _rowMargin;
        for (NSInteger j = 0; j < count; j++) {
            //计算生成并添加属性数组
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:j inSection:i];
            UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            CGFloat width = [_delegate widthWithLotteryLayout:self indexPath:indexPath];
            attr.frame = CGRectMake(cellWidth, _maxHeight, width, cellHeight);
            [_attrAry addObject:attr];
            cellWidth += width + _columnMargin;
        }
        _maxHeight += cellHeight;
        if (_maxWidth < cellWidth) _maxWidth = cellWidth;
    }
    _maxWidth += _edgeIndsets.right;
    _maxHeight += _edgeIndsets.bottom;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return _attrAry;
}

- (CGSize)collectionViewContentSize {
    return CGSizeMake(_maxWidth, _maxHeight);
}

@end
