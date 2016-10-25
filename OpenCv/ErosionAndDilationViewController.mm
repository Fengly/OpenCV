//
//  ErosionAndDilationViewController.m
//  OpenCv
//
//  Created by Riches on 2016/10/21.
//  Copyright © 2016年 Riches. All rights reserved.
//

#import "ErosionAndDilationViewController.h"

#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>
using namespace cv;

Mat src2, erosion_dst, dilation_dst;
int erosion_elem = 0;
int erosion_size = 0;
int dilation_elem = 0;
int dilation_size = 0;

@interface ErosionAndDilationViewController ()

@property (nonatomic, retain) UIImageView *imgView1;
@property (nonatomic, retain) UIImageView *imgView2;
@property (nonatomic, assign) NSInteger isType;  /**< 1 ：Eroding  2 ：Dilating  默认 1*/
@property (nonatomic, retain) UISlider *slider;
@property (nonatomic, retain) UIImage *img;

@end

@implementation ErosionAndDilationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isType = 1;
    [self initMat];
    [self createSubView];
}

- (void)initMat {
    self.img = [UIImage imageNamed:@"6.jpg"];
    UIImageToMat(_img, src2);
    [self erosion];
}

- (void)createSubView {
    [self createImageView];
    [self createButton];
    [self createButton2];
    [self createSlider];
}

- (void)createButton2 {
    NSArray *arr = @[@"MORPH_RECT", @"MORPH_CROSS", @"MORPH_ELLIPSE"];
    CGFloat w = (self.view.frame.size.width - 40) / 3;
    for (NSInteger i = 0; i < 3; i++) {
        UIButton *button = [UIButton buttonWithType:(UIButtonTypeSystem)];
        button.frame = CGRectMake(10 + (w + 10) * i, CGRectGetMaxY(_imgView2.frame) + 5 + 20 + 5, w, 20);
        [self.view addSubview:button];
        button.backgroundColor = [UIColor cyanColor];
        button.tag = 20000 + i;
        [button setTitle:arr[i] forState:(UIControlStateNormal)];
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        [button addTarget:self action:@selector(button2Click:) forControlEvents:(UIControlEventTouchUpInside)];
    }
}

- (void)createButton {
    NSArray *arr = @[@"Eroding", @"Dilating"];
    CGFloat w = (self.view.frame.size.width - 40) / 3;
    for (NSInteger i = 0; i < 2; i++) {
        UIButton *button = [UIButton buttonWithType:(UIButtonTypeSystem)];
        button.frame = CGRectMake(10 + (w + 10) * i, CGRectGetMaxY(_imgView2.frame) + 5, w, 20);
        [self.view addSubview:button];
        button.backgroundColor = [UIColor cyanColor];
        button.tag = 10000 + i;
        [button setTitle:arr[i] forState:(UIControlStateNormal)];
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:(UIControlEventTouchUpInside)];
    }
}

- (void)createSlider {
    self.slider = [[UISlider alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height - 50, self.view.frame.size.width - 20, 40)];
    [self.view addSubview:_slider];
    [_slider addTarget:self action:@selector(sliderAction:) forControlEvents:(UIControlEventValueChanged)];
}

- (void)createImageView {
    CGFloat h = self.view.frame.size.width * 2 / 3;
    self.imgView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, h)];
    [self.view addSubview:_imgView1];
    _imgView1.backgroundColor = [UIColor lightGrayColor];
    _imgView1.image = _img;
    
    self.imgView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_imgView1.frame) + 5, self.view.frame.size.width, h)];
    [self.view addSubview:_imgView2];
    _imgView2.backgroundColor = [UIColor lightGrayColor];
    _imgView2.image = _img;
}

/// 腐蚀
- (void)erosion {
    int erosion_type;
    if(dilation_elem == 0) {
        erosion_type = MORPH_RECT;
    }
    else if(dilation_elem == 1) {
        erosion_type = MORPH_CROSS;
    }
    else if(dilation_elem == 2) {
        erosion_type = MORPH_ELLIPSE;
    }
    Mat element = getStructuringElement(erosion_type,
                                        cv::Size(2 * erosion_size + 1, 2 * erosion_size + 1),
                                        cv::Point(erosion_size, erosion_size));
    /// 腐蚀操作
    erode(src2, erosion_dst, element);
    _imgView2.image = MatToUIImage(erosion_dst);
}

/// 膨胀
- (void)dilation {
    int dilation_type;
    if(dilation_elem == 0) {
        dilation_type = MORPH_RECT;
    }
    else if(dilation_elem == 1) {
        dilation_type = MORPH_CROSS;
    }
    else if(dilation_elem == 2) {
        dilation_type = MORPH_ELLIPSE;
    }
    Mat element = getStructuringElement(dilation_type,
                                        cv::Size(2 * dilation_size + 1, 2 * dilation_size + 1),
                                        cv::Point(dilation_size, dilation_size));
    /// 膨胀操作
    dilate(src2, dilation_dst, element);
    _imgView2.image = MatToUIImage(dilation_dst);
}


#pragma mark - action
- (void)buttonClick:(UIButton *)button {
    NSInteger tag = button.tag;
    switch (tag) {
        case 10000: {
            _isType = 1;
        } break;
        default: {
            _isType = 2;
        } break;
    }
    [self type];
}

- (void)button2Click:(UIButton *)button {
    NSInteger tag = button.tag;
    switch (tag) {
        case 20000: {
            dilation_elem = 0;
        } break;
        case 20001: {
            dilation_elem = 1;
        } break;
        default: {
            dilation_elem = 2;
        } break;
    }
    [self type];
}

- (void)sliderAction:(UISlider *)slider {
    if (_isType == 1) {
        slider.maximumValue = 21;
        erosion_size = slider.value;
    } else {
        slider.maximumValue = 21;
        dilation_size = slider.value;
    }
    [self type];
}

- (void)type {
    if (_isType == 1) {
        erosion_size = _slider.value;
        [self erosion];
    } else {
        dilation_size = _slider.value;
        [self dilation];
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
