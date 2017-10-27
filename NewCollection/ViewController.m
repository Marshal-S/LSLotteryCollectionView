//
//  ViewController.m
//  NewCollection
//
//  Created by Marshal on 2017/10/26.
//  Copyright © 2017年 Marshal. All rights reserved.
//

#import "ViewController.h"
#import "LSNumberCell.h"
#import "LSLotteryLayout.h"

NSString * identifier = @"identifier";

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, LSLotteryLayoutDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray<NSArray *> *dataAry;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initCollectionData];
    [self initCollectionView];
}

- (void)initCollectionData {
    _dataAry = [NSMutableArray array];
    for (NSInteger i = 0; i < 60; i++) {
        NSMutableArray *tem = [NSMutableArray array];
        for (NSInteger j = 0; j < 60; j++) {
            [tem addObject:[NSString stringWithFormat:@"%ld行%ld列",i,j]];
        }
        [_dataAry addObject:tem];
    }
}

- (void)initCollectionView {
    LSLotteryLayout *layout = [[LSLotteryLayout alloc] init];
    layout.delegate = self;
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    [_collectionView registerClass:[LSNumberCell class] forCellWithReuseIdentifier:identifier];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _dataAry.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_dataAry[section] count];
}

- (CGFloat)heightWithLotteryLayout:(LSLotteryLayout *)lotteryLayout section:(NSInteger)section {
    return 60;
}

- (CGFloat)widthWithLotteryLayout:(LSLotteryLayout *)lotteryLayout indexPath:(NSIndexPath *)indexPath {
    //这里返回一个简单的垒砖的高度
    if (indexPath.section % 2) {
        if (indexPath.row == 0) {
            return 80;
        }
    }
    return 160;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LSNumberCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    NSArray *tem = _dataAry[indexPath.section];
    [cell updateText:tem[indexPath.row]];
    NSLog(@"text:%@ \t section:%ld \t row%ld",cell.lblText.text ,indexPath.section, indexPath.row);
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
