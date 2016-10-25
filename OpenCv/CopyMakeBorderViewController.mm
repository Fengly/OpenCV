//
//  CopyMakeBorderViewController.m
//  OpenCv
//
//  Created by Riches on 2016/10/22.
//  Copyright © 2016年 Riches. All rights reserved.
//

#import "CopyMakeBorderViewController.h"

#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>

using namespace cv;
/// 全局变量
Mat src_CMB, dst_CMB;
int top, bottom, left, right;
int borderType;
Scalar value;
RNG rng(12345);

@interface CopyMakeBorderViewController ()

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UIImageView *imageView2;

@end

@implementation CopyMakeBorderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.width * 2 / 3)];
    [self.view addSubview:_imageView];
    
    self.imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_imageView.frame) + 5, self.view.frame.size.width, self.view.frame.size.width * 2 / 3)];
    [self.view addSubview:_imageView2];
    
    UIImage *img = [UIImage imageNamed:@"6_S"];
    UIImageToMat(img, src_CMB);
    
    /// 初始化输入参数
    top = (int)(0.3 * src_CMB.rows);     // 上
    bottom = (int)(0.3 * src_CMB.rows);  // 下
    left = (int)(0.3 * src_CMB.cols);    // 左
    right = (int)(0.3 * src_CMB.cols);   // 右
    dst_CMB = src_CMB;
    
    _imageView2.image = MatToUIImage(dst_CMB);
    
    borderType = BORDER_CONSTANT;

    // 计算颜色
    value = Scalar(rng.uniform(0, 255), rng.uniform(0, 255), rng.uniform(0, 255));
    // 加入边框
    copyMakeBorder(src_CMB, dst_CMB, top, bottom, left, right, borderType, value);
    _imageView.image = MatToUIImage(dst_CMB);
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timer:) userInfo:nil repeats:YES];
    [timer fire];
}

- (void)timer:(NSTimer *)timer {
    // 计算颜色
    value = Scalar(rng.uniform(0, 255), rng.uniform(0, 255), rng.uniform(0, 255));
    // 加入边框
    copyMakeBorder(src_CMB, dst_CMB, top, bottom, left, right, borderType, value);
    _imageView.image = MatToUIImage(dst_CMB);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
