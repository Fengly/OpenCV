//
//  RemappingViewController.m
//  OpenCv
//
//  Created by Riches on 2016/10/24.
//  Copyright © 2016年 Riches. All rights reserved.
//

#import "RemappingViewController.h"

#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>

// https://github.com/Fengly/Remapping

using namespace cv;

Mat src_R, dst_R;
Mat map_x_R, map_y_R;
int ind_R = 4;

@interface RemappingViewController ()

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UIImageView *imageView2;

@end

@implementation RemappingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.width * 2 / 3)];
    [self.view addSubview:_imageView];
    
    self.imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_imageView.frame) + 5, self.view.frame.size.width, self.view.frame.size.width * 2 / 3)];
    [self.view addSubview:_imageView2];
    
    /// Load the image
    UIImage *image = [UIImage imageNamed:@"mm.jpeg"];
    _imageView2.image = image;
    
    UIImageToMat(image, src_R);
    /// Create dst, map_x and map_y with the same size as src:
    dst_R.create(src_R.size(), src_R.type());
    map_x_R.create(src_R.size(), CV_32FC1);
    map_y_R.create(src_R.size(), CV_32FC1);
    /// Update map_x & map_y. Then apply remap
    update_map();
    remap(src_R, dst_R, map_x_R, map_y_R, CV_INTER_LINEAR, BORDER_CONSTANT, Scalar(0, 0, 0));
    _imageView.image = MatToUIImage(dst_R);
    
    [self createTimer];
}

- (void)createTimer {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerA:) userInfo:nil repeats:YES];
    [timer fire];
}

- (void)timerA:(NSTimer *)timer {
//    ind_R = ind_R + 1;
    NSLog(@"%d", ind_R);
    update_map();
    remap(src_R, dst_R, map_x_R, map_y_R, CV_INTER_LINEAR, BORDER_CONSTANT, Scalar(0, 0, 0));
    _imageView.image = MatToUIImage(dst_R);
}

void update_map() {
    ind_R = ind_R % 4;
    for(int j = 0; j < src_R.rows; j++) {
        for(int i = 0; i < src_R.cols; i++) {
            switch(ind_R) {
                case 0:
                    if(i > src_R.cols * 0.25 && i < src_R.cols * 0.75 && j > src_R.rows * 0.25 && j < src_R.rows * 0.75) {
                        map_x_R.at<float>(j, i) = 2 * (i - src_R.cols * 0.25) + 0.5;
                        map_y_R.at<float>(j, i) = 2 * (j - src_R.rows * 0.25) + 0.5;
                    } else { map_x_R.at<float>(j, i) = 0;
                        map_y_R.at<float>(j, i) = 0;
                    }
                    break;
                case 1:
                    map_x_R.at<float>(j, i) = i;
                    map_y_R.at<float>(j, i) = src_R.rows - j;
                    break;
                case 2:
                    map_x_R.at<float>(j, i) = src_R.cols - i;
                    map_y_R.at<float>(j, i) = j;
                    break;
                case 3:
                    map_x_R.at<float>(j, i) = src_R.cols - i;
                    map_y_R.at<float>(j, i) = src_R.rows - j;
                    break;
            }
        }
    }
    if (ind_R >= 3) {
        ind_R = -1;
    }
    ind_R++;
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
