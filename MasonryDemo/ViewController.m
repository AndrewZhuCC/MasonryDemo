//
//  ViewController.m
//  MasonryDemo
//
//  Created by 朱安智 on 2017/1/17.
//  Copyright © 2017年 Andrew. All rights reserved.
//

#import "ViewController.h"

#import <Masonry.h>

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UILabel *lbSubview;
@property (nonatomic, strong) UIView *vSuperView;
@property (nonatomic, strong) UITextField *tfInput;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupConstaints];
}

- (void)setupConstaints {
    [self.vSuperView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.tfInput.mas_bottom).with.offset(10);
    }];
    [self.lbSubview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.vSuperView).with.insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
    [self.tfInput mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).with.offset(-20);
        make.left.and.top.equalTo(self.view).with.offset(20);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    self.lbSubview.text = textField.text;
    [self.view setNeedsLayout];
    return YES;
}

- (UITextField *)tfInput {
    if (!_tfInput) {
        _tfInput = [UITextField new];
        _tfInput.borderStyle = UITextBorderStyleRoundedRect;
        _tfInput.delegate = self;
        [self.view addSubview:_tfInput];
    }
    return _tfInput;
}

- (UIView *)vSuperView {
    if (!_vSuperView) {
        _vSuperView = [UIView new];
        _vSuperView.backgroundColor = [UIColor blackColor];
        [self.view addSubview:_vSuperView];
    }
    return _vSuperView;
}

- (UILabel *)lbSubview {
    if (!_lbSubview) {
        _lbSubview = [UILabel new];
        _lbSubview.numberOfLines = 0;
        _lbSubview.textColor = [UIColor whiteColor];
        _lbSubview.backgroundColor = [UIColor grayColor];
        [self.vSuperView addSubview:_lbSubview];
    }
    return _lbSubview;
}


@end
