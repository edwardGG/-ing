//
//  LiveViewController.m
//  pods
//
//  Created by Edward on 16/7/4.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "LiveViewController.h"
#import "ChooseChannelCell.h"
#import "LiveViewModel.h"
#import "HeaderView.h"
#import "recommandCollectionViewCell.h"
#import "TopCell.h"
#import "DetailViewController.h"
#import "DetailViewModel.h"
#import "BottomView.h"

#define kChooseChannelCellHeight 140
#define kRecommandCellHeight 180
#define kheaderViewHeight 35
#define kTopCellHeight 122

@interface LiveViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
//主tableView
@property (nonatomic, strong) UITableView *mainTableView;
//选择频道的collection View
@property (nonatomic, strong) UICollectionView *chooseChannelView;
@property (nonatomic) LiveViewModel *liveModel;
//推荐电台的colletionView
@property (nonatomic, strong) UICollectionView *recommandView;
@property (nonatomic) DetailViewModel *detailViewModel;
//底部View
@property (nonatomic, strong) BottomView *bottomView;

@end

@implementation LiveViewController
#pragma nib初始化
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"直 播";
    }
    return self;
}
#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if(section == 1){
        return 1;
    }else{
        return self.liveModel.topRowNumber;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        UIImageView *iv= [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kChooseChannelCellHeight)];
        //背景imageView
        iv.image = [UIImage imageNamed:@"backgroundimage"];
        iv.contentMode = UIViewContentModeScaleToFill;
        [cell.contentView addSubview:iv];
        [cell.contentView addSubview:self.chooseChannelView];
        [self chooseChannelView];
        [self.view bringSubviewToFront:self.chooseChannelView];
        return cell;
    }else if(indexPath.section == 1){
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"recommandCell"];
        [cell.contentView addSubview:self.recommandView];
        return cell;
    }else{
        TopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopCell"];
        [cell.topImage setImageWithURL:[self.liveModel topIconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"01"]];
        cell.bigTitle.text = [self.liveModel topRnameForRow:indexPath.row];
        cell.centerTitle.text = [self.liveModel programNameForRow:indexPath.row];
        cell.playCount.text = [self.liveModel playcountForRow:indexPath.row];

        return cell;
    }
}

//头部高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.1;
    }else if(section == 1){
        return kheaderViewHeight + 2;
    }else{
        return kheaderViewHeight + 1;
    }
}

//tableView的脚步视图行高
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 8;
    }else{
        return 8;
    }
}

//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return kChooseChannelCellHeight;
    }
    else if(indexPath.section == 1){
        return kRecommandCellHeight;
    }else{
        return kTopCellHeight;
    }
}

//tableView点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailViewController *detailVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"DetailViewController"];

    detailVC.detailViewModel.radioId = [self.liveModel radioIdForRow:indexPath.row];
    detailVC.detailViewModel.programId = [self.liveModel programIdForRow:indexPath.row];
    detailVC.radioURL = [self.liveModel topRadioURLForRow:indexPath.row];
    detailVC.detailViewModel.centerImage = [self.liveModel topIconURLForRow:indexPath.row];

    [self presentViewController:detailVC animated:YES completion:^{
        
    }];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
     HeaderView *headView = [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kheaderViewHeight)];
    if (section == 1) {
        headView.isMore = NO;
        headView.headLb.text = @"推荐电台";
        return headView;
    }else if(section == 2){
        headView.isMore = YES;
        headView.headLb.text = @"排行榜";
        [headView.moreBtn addTarget:self action:@selector(clickMoreBtn) forControlEvents:UIControlEventTouchUpInside];
        return headView;
    }else{
    return nil;
    }
}

#pragma mark - 方法 methods
//点击更多触发的方法
- (void)clickMoreBtn{
    NSLog(@"more");
}

#pragma mark - UICollectionView Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (collectionView == _chooseChannelView) {
        return 4;
    }else if (collectionView == _recommandView){
        return self.liveModel.rowNumber;
    }else{
        return 0;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView == _chooseChannelView) {
    ChooseChannelCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ChooseChannelCell" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.chooseChannelV.image = [UIImage imageNamed:@"iconfont-local"];
        cell.chooseChannelLb.text = @"本地台";
        
        return cell;
    }else if (indexPath.row == 1) {
        cell.chooseChannelV.image = [UIImage imageNamed:@"iconfont-guojia"];
        cell.chooseChannelLb.text = @"国家台";
        return cell;
    }
    else if (indexPath.row == 2) {
        cell.chooseChannelV.image = [UIImage imageNamed:@"iconfont-520shengshijilian"];
        cell.chooseChannelLb.text = @"省市台";
        return cell;
    }else{
        cell.chooseChannelV.image = [UIImage imageNamed:@"iconfont-xinhaota"];
        cell.chooseChannelLb.text = @"网络台";
        return cell;
    }
    }
    if (collectionView == _recommandView){
        recommandCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"recommandCollectionViewCell" forIndexPath:indexPath];
        [cell.recommandCellImage setImageWithURL:[self.liveModel iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"00"]];
        cell.recommandCellTitle.text = [self.liveModel rnameForRow:indexPath.row];
        return cell;
    }
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self mainTableView];
    [self recommandView];
    [self bottomView];
//    UILabel *lv = [[UILabel alloc] init];
//    [self.view addSubview:lv];
//    [lv mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(10);
//        make.right.bottom.equalTo(-10);
//        make.height.equalTo(100);
//    }];
//    
//    lv.text = @"asdasd";
//    lv.font = [UIFont systemFontOfSize:14];
//    lv.backgroundColor = [UIColor whiteColor];
//    lv.textAlignment = NSTextAlignmentCenter;
//    [lv sizeToFit];
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - lazy load
- (UICollectionView *)chooseChannelView {
    if(_chooseChannelView == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(self.view.frame.size.width/4, kChooseChannelCellHeight);
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 0;
        _chooseChannelView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:flowLayout];
        _chooseChannelView.delegate = self;
        _chooseChannelView.dataSource = self;
        [_chooseChannelView registerNib:[UINib nibWithNibName:@"ChooseChannelCell" bundle:nil] forCellWithReuseIdentifier:@"ChooseChannelCell"];
        _chooseChannelView.backgroundColor = [UIColor clearColor];
    }
    return _chooseChannelView;
}

- (UITableView *)mainTableView {
    if(_mainTableView == nil) {
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 200) style:UITableViewStyleGrouped];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.backgroundColor = kRGBA(236, 240, 241, 1);
        [self.view addSubview:_mainTableView];
 //添加头部刷新
        WK(weakSelf);
        [_mainTableView addHeaderRefresh:^{
            [weakSelf.liveModel getDataCompletionHandler:^(NSError *error) {
                [weakSelf.recommandView reloadData];
                [weakSelf.mainTableView reloadData];
                [weakSelf.mainTableView endHeaderRefresh];
            }];
        }];
 //添加脚部刷新
        [_mainTableView addAutoFooterRefresh:^{
            [weakSelf.liveModel getDataCompletionHandler:^(NSError *error) {
                [weakSelf.mainTableView reloadData];
                [weakSelf.mainTableView endFooterRefreshWithNoMoreData];
            }];
        }];
        [_mainTableView beginHeaderRefresh];
        [_mainTableView registerNib:[UINib nibWithNibName:@"TopCell" bundle:nil] forCellReuseIdentifier:@"TopCell"];
    }
    return _mainTableView;
}


- (LiveViewModel *)liveModel {
	if(_liveModel == nil) {
		_liveModel = [[LiveViewModel alloc] init];
	}
	return _liveModel;
}

- (UICollectionView *)recommandView {
	if(_recommandView == nil) {
        UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
        flowlayout.minimumLineSpacing = 0;
        flowlayout.minimumInteritemSpacing = 0;
        flowlayout.itemSize = CGSizeMake(kScreenW / 3, kRecommandCellHeight);
		_recommandView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kRecommandCellHeight) collectionViewLayout:flowlayout];
        _recommandView.delegate = self;
        _recommandView.dataSource = self;
        [_recommandView registerNib:[UINib nibWithNibName:@"recommandCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"recommandCollectionViewCell"];
        _recommandView.backgroundColor = [UIColor whiteColor];
      	}
	return _recommandView;
}

- (DetailViewModel *)detailViewModel {
	if(_detailViewModel == nil) {
		_detailViewModel = [[DetailViewModel alloc] init];
	}
	return _detailViewModel;
}

- (BottomView *)bottomView {
	if(_bottomView == nil) {
		_bottomView = [BottomView sharedBottomView];
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(44);
        }];
        [self.view addSubview:_bottomView];
	}
	return _bottomView;
}

@end
