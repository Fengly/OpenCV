//
//  ThresholdViewController.m
//  OpenCv
//
//  Created by Riches on 2016/10/22.
//  Copyright © 2016年 Riches. All rights reserved.
//

#import "ThresholdViewController.h"

#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>

using namespace cv;

int threshold_value = 0;  /**< 控制阈值 */
int threshold_type = 3;   /**< 控制阈（yu）值类型 */

Mat src_t, src_t_gray, dst_t;

@interface ThresholdViewController ()

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UIImageView *imageView2;
@property (nonatomic, retain) UIImageView *imageView3;

@end

@implementation ThresholdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.width * 2 / 3)];
    [self.view addSubview:_imageView];
    
    self.imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_imageView.frame) + 5, self.view.frame.size.width / 2, self.view.frame.size.width * 2 / 3 / 2)];
    [self.view addSubview:_imageView2];
    
    self.imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_imageView2.frame), CGRectGetMaxY(_imageView.frame) + 5, self.view.frame.size.width / 2, self.view.frame.size.width * 2 / 3 / 2)];
    [self.view addSubview:_imageView3];
    
    UIImage *img = [UIImage imageNamed:@"6_S"];
    UIImageToMat(img, src_t);
    // 灰度转化
    cvtColor(src_t, src_t_gray, CV_RGB2GRAY);
    _imageView.image = MatToUIImage(src_t_gray);
    _imageView2.image = img;
    _imageView3.image = MatToUIImage(src_t_gray);
    
    [self createSlider];
}

// 这里需要创建Slider 来控制阈值
- (void)createSlider {
    CGFloat w = self.view.frame.size.width - 40;
    CGFloat y = self.view.frame.size.height - 50;
    for (NSInteger i = 0; i < 2; i++) {
        UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(20, y - (40 + 5) * i, w, 40)];
        [self.view addSubview:slider];
        slider.continuous = YES;
        slider.tag = 1000 + i;
        [slider addTarget:self action:@selector(sliderAction:) forControlEvents:(UIControlEventValueChanged)];
        if (i == 0) {
            slider.maximumValue = 255;
            slider.minimumValue = 0;
        } else {
            slider.maximumValue = 4;
            slider.minimumValue = 0;
            slider.value = threshold_type;
        }
    }
}

- (void)threshold {
    /* 
     0: 二进制阈值
     1: 反二进制阈值
     2: 截断阈值
     3: 0阈值
     4: 反0阈值
     */
    threshold(src_t_gray, dst_t, threshold_value, 255,threshold_type);
    _imageView.image = MatToUIImage(dst_t);
}



#pragma mark - slider action

- (void)sliderAction:(UISlider *)slider {
    NSUInteger index = (NSUInteger)(slider.value + 0.5);
    [slider setValue:index animated:NO];
    if (slider.tag == 1000) {
        threshold_value = slider.value;  /**< 阈值的控制 */
    } else {
        threshold_type = (int)index; /**< 阈值类型的控制 */
    }
    [self threshold];
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
