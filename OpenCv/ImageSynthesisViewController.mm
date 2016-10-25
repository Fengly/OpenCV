//
//  ImageSynthesisViewController.m
//  OpenCv
//
//  Created by Riches on 2016/10/24.
//  Copyright © 2016年 Riches. All rights reserved.
//

#import "ImageSynthesisViewController.h"
#import <SceneKit/SceneKit.h>

#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>

using namespace cv;

@interface ImageSynthesisViewController ()

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UIImageView *imageView2;

@end

@implementation ImageSynthesisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.width * 2 / 3)];
    [self.view addSubview:_imageView];
    
    self.imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_imageView.frame) + 5, self.view.frame.size.width, self.view.frame.size.width * 2 / 3)];
    [self.view addSubview:_imageView2];
    
    Mat image, logo, mask;
    UIImage *img1 = [UIImage imageNamed:@"b.jpg"];
    UIImageToMat(img1, image);
    UIImage *img2 = [UIImage imageNamed:@"55.png"];
    UIImageToMat(img2, logo);
    UIImageToMat(img2, mask, 0);
    Mat imageROI;
    imageROI = image(cv::Rect(0, 0, logo.cols, logo.rows));
    logo.copyTo(imageROI, mask);
//    addWeighted(imageROI, 0.8, logo, 0.8, 0, imageROI);
    _imageView.image = MatToUIImage(image);
    
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
