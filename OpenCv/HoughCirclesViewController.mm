//
//  HoughCirclesViewController.m
//  OpenCv
//
//  Created by Riches on 2016/10/24.
//  Copyright © 2016年 Riches. All rights reserved.
//

#import "HoughCirclesViewController.h"
#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>

using namespace cv;
using namespace std;

@interface HoughCirclesViewController ()

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UIImageView *imageView2;

@end

@implementation HoughCirclesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.width * 2 / 3)];
    [self.view addSubview:_imageView];
    
    self.imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_imageView.frame) + 5, self.view.frame.size.width, self.view.frame.size.width * 2 / 3)];
    [self.view addSubview:_imageView2];
    
    
    UIImage *image = [UIImage imageNamed:@"u=292611436,1459964882&fm=21&gp=0.jpg"];
    _imageView2.image = image;
    
    Mat src, src_gray;
    /// Load the image
    UIImageToMat(image, src);

    /// Convert it to gray
    cvtColor( src, src_gray, CV_BGR2GRAY );
    
    /// Reduce the noise so we avoid false circle detection
    GaussianBlur( src_gray, src_gray, cv::Size(9, 9), 2, 2 );
    
    vector<Vec3f> circles;
    
    /// Apply the Hough Transform to find the circles
    HoughCircles( src_gray, circles, CV_HOUGH_GRADIENT, 1, src_gray.rows/8, 200, 100, 0, 0 );
    
    /// Draw the circles detected
    for( size_t i = 0; i < circles.size(); i++ ) {
        cv::Point center(cvRound(circles[i][0]), cvRound(circles[i][1]));
        int radius = cvRound(circles[i][2]);
        // circle center
        circle( src, center, 3, Scalar(0,255,0), -1, 8, 0 );
        // circle outline
        circle( src, center, radius, Scalar(0,0,255), 3, 8, 0 );
    }
    _imageView.image = MatToUIImage(src);
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
