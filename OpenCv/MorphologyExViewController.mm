//
//  MorphologyExViewController.m
//  OpenCv
//
//  Created by Riches on 2016/10/21.
//  Copyright © 2016年 Riches. All rights reserved.
//

#import "MorphologyExViewController.h"
#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>

using namespace cv;

/// 全局变量
Mat m_src, m_dst;

int morph_elem = 0;
int morph_size = 0;
int morph_operator = 0;

@interface MorphologyExViewController ()

@property (nonatomic, retain) UIImageView *imgView1;
@property (nonatomic, retain) UIImageView *imgView2;

@property (nonatomic, retain) UIImage *img;

@end

@implementation MorphologyExViewController {
    NSArray *numbers;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initMat];
    
    [self createSlider];
    
    [self createImageView];
}

- (void)initMat {
    self.img = [UIImage imageNamed:@"6_S.png"];
    UIImageToMat(_img, m_src);
    [self morphologyEx];
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

- (void)createSlider {
    NSArray *tempArr = @[@"Operator ：", @"Element ：", @"Kernel Size ："];
    CGFloat w = self.view.frame.size.width - 100;
    CGFloat y = self.view.frame.size.height - 50;
    for (NSInteger i = 0; i < 3; i++) {
        UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(90,  y - 45 * i, w, 40)];
        [self.view addSubview:slider];
        [slider addTarget:self action:@selector(valueChanged:)
        forControlEvents:UIControlEventValueChanged];
        [self sliderMumValueWith:i slider:slider];
        slider.tag = 1000 + i;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, y - 45 * i, 80, 40)];
        label.textAlignment = NSTextAlignmentRight;
        [self.view addSubview:label];
        label.font = [UIFont systemFontOfSize:10];
        label.text = tempArr[i];
    }
}

- (void)sliderMumValueWith:(NSInteger)i slider:(UISlider *)slider {
    switch (i) {
        case 0: {
            slider.continuous = YES; // NO makes it call only once you let go
            slider.minimumValue = 2;
            slider.maximumValue = 6;
        } break;
        case 1: {
            slider.continuous = YES; // NO makes it call only once you let go
            slider.minimumValue = 0;
            slider.maximumValue = 2;
        } break;
        case 2: {
            slider.continuous = YES; // NO makes it call only once you let go
            slider.minimumValue = 0;
            slider.maximumValue = 21;
        } break;
    }
}


- (void)morphologyEx {
    // 由于 MORPH_X的取值范围是: 2,3,4,5 和 6
    Mat element = getStructuringElement(morph_elem, cv::Size(2 * morph_size + 1, 2 * morph_size + 1), cv::Point(morph_size, morph_size));
    /// 运行指定形态学操作
    morphologyEx(m_src, m_dst, morph_operator, element);
    _imgView2.image = MatToUIImage(m_dst);
}


#pragma mark - Slider Action
- (void)valueChanged:(UISlider *)slider {
    NSInteger tag = slider.tag;
    switch (tag) {
        case 1000:{
            NSUInteger index = (NSUInteger)(slider.value + 0.5);
            [slider setValue:index animated:NO];
            morph_operator = slider.value;
        } break;
        case 1001:{
            NSUInteger index = (NSUInteger)(slider.value + 0.5);
            [slider setValue:index animated:NO];
            morph_elem = slider.value;
        } break;
        case 1002:{
            NSUInteger index = (NSUInteger)(slider.value + 0.5);
            [slider setValue:index animated:NO];
            morph_size = slider.value;
        } break;
    }
    [self morphologyEx];
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
