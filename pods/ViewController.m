//
//  ViewController.m
//  pods
//
//  Created by Edward on 16/6/30.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) SmallBtnAddBigBtnView *firstView;
@property (nonatomic) UIImageView *backImage;

@end

@implementation ViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"首 页";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addFirstViewBtn];
    [self firstView];
    [self backImage];
    [self.view sendSubviewToBack:_backImage];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.firstView.center = self.view.center;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addFirstViewBtn{
    SmallBtn *sub1 = [[SmallBtn alloc] initWithFrame:CGRectMake(0, 0, 60, 60) Image:@"zhiboPT"];
    SmallBtn *sub2 = [[SmallBtn alloc] initWithFrame:CGRectMake(0, 0, 60, 60) Image:@"yinyuePT"];
    SmallBtn *sub3 = [[SmallBtn alloc] initWithFrame:CGRectMake(0, 0, 60, 60) Image:@"zhuboPT"];
    SmallBtn *sub4 = [[SmallBtn alloc] initWithFrame:CGRectMake(0, 0, 60, 60) Image:@"wodePT"];
    NSArray *items = @[sub1,
                       sub2,
                       sub3,
                       sub4,
                       ];
    
    self.firstView.scale = YES;
    [self.firstView.mainView.btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [sub1 addTarget:self action:@selector(pushLiveViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.firstView setMenuItems:items];
}

#pragma mark - 方法 methods
- (void)pushLiveViewController{
    LiveViewController *LiveVC = [LiveViewController new];
    [self.navigationController pushViewController:LiveVC animated:YES];
}

- (void)click{
    if (self.firstView.isExpend) {
        [self.firstView expend:NO];
    }
    else {
        [self.firstView expend:YES];
    }
}

#pragma mark - lazy load
- (SmallBtnAddBigBtnView *)firstView {
	if(_firstView == nil) {
		_firstView = [[SmallBtnAddBigBtnView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
        [self.view addSubview:_firstView];
	}
	return _firstView;
}

- (UIImageView *)backImage {
	if(_backImage == nil) {
		_backImage = [[UIImageView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:_backImage];
        _backImage.image = [UIImage imageNamed:@"beijing8"];
	}
	return _backImage;
}

@end
