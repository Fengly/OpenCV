//
//  ImgprocViewController.m
//  OpenCv
//
//  Created by Riches on 2016/10/20.
//  Copyright © 2016年 Riches. All rights reserved.
//

#import "ImgprocViewController.h"

#import <opencv2/opencv.hpp>
//#import <opencv2/imgproc.hpp>
#import <opencv2/imgcodecs/ios.h>

using namespace cv;

/// 全局变量
//int DELAY_CAPTION = 1500;
//int DELAY_BLUR = 100;
int MAX_KERNEL_LENGTH = 20;

Mat src, dst;



/// 函数申明
void display_caption(char *caption);

@interface ImgprocViewController ()

@property (nonatomic, retain) UIImageView *imageView1; /**< 显示 图像 */

@end

@implementation ImgprocViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, self.view.frame.size.width)];
    [self.view addSubview:_imageView1];
    UIImage *image = [UIImage imageNamed:@"6.jpg"];
    _imageView1.image = image;
    
    UIImageToMat(image, src);
//    src.flags = 3;
    
//    display_caption("Original Image");
//    
    
    // 使用 均值平滑
//    display_caption("Homogeneous Blur");
    
    /// 创建腐蚀 Trackbar
//    createTrackbar("", "ImgprocViewController", &erosion_elem, max_elem, Erosion);
//    
// 
//    
//    createTrackbar( "Kernel size:\n 2n +1", "ImgprocViewController",
//                   &erosion_size, max_kernel_size, Erosion);
//    
//    /// 创建膨胀 Trackbar
//    createTrackbar( "Element:\n 0: Rect \n 1: Cross \n 2: Ellipse", "ImgprocViewController",
//                   &dilation_elem, max_elem, Dilation);
//    
//    createTrackbar( "Kernel size:\n 2n +1", "ImgprocViewController",
//                   &dilation_size, max_kernel_size, Dilation);
    
    /// Default start

    
    //    Erosion( 0, 0 );
//    Dilation( 0, 0 );
//    
//    _imageView1.image = MatToUIImage(dilation_dst);
    
     /// 使用高斯平滑

    [self createButton];
    
}




- (void)display_captionWith:(NSString *)caption {
    
    
}

void display_caption(String caption) {
    dst = Mat::zeros(src.size(), src.type());
    putText(dst, caption,
            cv::Point( src.cols/4, src.rows/2),
            CV_FONT_HERSHEY_COMPLEX, 1, Scalar(255, 255, 255));
}







- (void)createButton {
    NSArray *arr = @[@"Original", @"Homogeneous", @"Gaussian", @"Median"];
    CGFloat w = self.view.frame.size.width / 4;
    CGFloat y = self.view.frame.size.height - 50;
    for (NSInteger i = 0; i < 4; i++) {
        UIButton *button = [UIButton buttonWithType:(UIButtonTypeSystem)];
        button.frame = CGRectMake(w * i, y, w, 40);
        [self.view addSubview:button];
        button.backgroundColor = [UIColor lightGrayColor];
        [button setTitle:arr[i] forState:(UIControlStateNormal)];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:(UIControlEventTouchUpInside)];
        button.titleLabel.font = [UIFont systemFontOfSize:11];
        button.tag = 1000 + i;
    }
}

- (void)buttonClick:(UIButton *)button {
    NSInteger tag = button.tag;
    switch (tag) {
        case 1000: {
            _imageView1.image = MatToUIImage(src);
        } break;
            // 均值
        case 1001: {
            for (int i = 1; i < MAX_KERNEL_LENGTH; i += 2) {
                blur(src, dst, cv::Size(i, i));
            }
            _imageView1.image = MatToUIImage(dst);
        } break;
            // 高斯
        case 1002: {
            for (int i = 1; i < MAX_KERNEL_LENGTH; i += 2) {
                GaussianBlur(src, dst, cv::Size(i, i), 0);
            }
            _imageView1.image = MatToUIImage(dst);
        } break;
            // 中值
        case 1003: {
            for (int i = 1; i < MAX_KERNEL_LENGTH; i += 2) {
                medianBlur(src, dst, i);
            }
            _imageView1.image = MatToUIImage(dst);
        } break;
    }
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
