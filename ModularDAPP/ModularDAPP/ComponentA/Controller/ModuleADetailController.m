//
//  ModuleADetailController.m
//  ModularAPP
//
//  Created by 崔曦 on 2018/10/26.
//  Copyright © 2018 崔曦. All rights reserved.
//

#import "ModuleADetailController.h"
#import "Masonry.h"
@interface ModuleADetailController ()

@property (nonatomic, strong, readwrite) UILabel *valueLabel;
@property (nonatomic, strong, readwrite) UIImageView *imageView;

@property (nonatomic, strong) UIButton *returnButton;

@end

@implementation ModuleADetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:self.valueLabel];
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.returnButton];
    [self davd_monsory];
    // Do any additional setup after loading the view.
}

-(void)davd_monsory{
    
    [self.valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(70);
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.height.equalTo(@50);
    }];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.valueLabel.mas_bottom).offset(20);
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.height.equalTo(@80);
    }];
    
    [self.returnButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom).offset(50);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@100);
        make.height.equalTo(@50);
    }];
    
    
}
#pragma mark - event response
- (void)didTappedReturnButton:(UIButton *)button
{
    if (self.navigationController == nil) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - getters and setters
- (UILabel *)valueLabel
{
    if (_valueLabel == nil) {
        _valueLabel = [[UILabel alloc] init];
        _valueLabel.font = [UIFont systemFontOfSize:30];
        _valueLabel.textColor = [UIColor redColor];
    }
    return _valueLabel;
}

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

- (UIButton *)returnButton
{
    if (_returnButton == nil) {
        _returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_returnButton addTarget:self action:@selector(didTappedReturnButton:) forControlEvents:UIControlEventTouchUpInside];
        [_returnButton setTitle:@"return" forState:UIControlStateNormal];
        [_returnButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    return _returnButton;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
