//
//  Filter2DViewController.m
//  OpenCv
//
//  Created by Riches on 2016/10/22.
//  Copyright © 2016年 Riches. All rights reserved.
//

#import "Filter2DViewController.h"

#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>

using namespace cv;

int kernel_size;
int ind = 0;
Mat src_F2D, dst_F2D;
Mat kernel;
cv::Point anchor(-1, -1);
double delta = 0;
int ddepth = -1;

@interface Filter2DViewController ()

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UIImageView *imageView2;

@end

@implementation Filter2DViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.width * 2 / 3)];
    [self.view addSubview:_imageView];
    
    self.imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_imageView.frame) + 5, self.view.frame.size.width, self.view.frame.size.width * 2 / 3)];
    [self.view addSubview:_imageView2];
    
    // 获取图像
    UIImage *image = [UIImage imageNamed:@"mm.jpeg"];
    UIImageToMat(image, src_F2D);
    
    /// 更新归一化块滤波器的核大小
    kernel_size = 3 + 2 * (ind % 5);
    kernel = Mat::ones(kernel_size, kernel_size, CV_32F) / (float)(kernel_size*kernel_size);
    
    /// 使用滤波器
    filter2D(src_F2D, dst_F2D, ddepth, kernel, anchor, delta, BORDER_DEFAULT);
    _imageView.image = MatToUIImage(dst_F2D);
    _imageView2.image = image;
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timer:) userInfo:nil repeats:YES];
    [timer fire];
}

- (void)timer:(NSTimer *)timer {
    /// 更新归一化块滤波器的核大小
    kernel_size = 3 + 2 * (ind % 5);
    kernel = Mat::ones(kernel_size, kernel_size, CV_32F) / (float)(kernel_size*kernel_size);
    
    /// 使用滤波器
    filter2D(src_F2D, dst_F2D, ddepth , kernel, anchor, delta, BORDER_DEFAULT);
    _imageView.image = MatToUIImage(dst_F2D);
    ind++;
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
