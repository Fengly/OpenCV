//
//  HistogramViewController.m
//  OpenCv
//
//  Created by Riches on 2016/10/21.
//  Copyright © 2016年 Riches. All rights reserved.
//

#import "HistogramViewController.h"

#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>

using namespace cv;

/// 全局变量
Mat src_p, dst_p, tmp_p;

@interface HistogramViewController ()

@property (nonatomic, retain) UIImageView *imageView;

@property (nonatomic, assign) NSInteger cant;

@end

@implementation HistogramViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.width * 2 / 3)];
    [self.view addSubview:_imageView];
    
//    [self sss];
    UIImage *img = [UIImage imageNamed:@"6_S.png"];
    _imageView.image = img;
    
    UIImageToMat(img, src_p);
    tmp_p = src_p;
    _cant = 0;
    
    [self createButton];
}

- (void)createButton {
    NSArray *arr = @[@"payUp", @"pyrDown"];
    CGFloat w = (self.view.frame.size.width - 15) / 2;
    CGFloat y = self.view.frame.size.height - 45;
    for (NSInteger i = 0; i < 2; i++) {
        UIButton *bt = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [self.view addSubview:bt];
        bt.frame = CGRectMake(5 + (w + 5) * i, y, w, 40);
        [bt setTitle:arr[i] forState:(UIControlStateNormal)];
        bt.tag = 1000 + i;
        [bt addTarget:self action:@selector(btAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
}

- (void)btAction:(UIButton *)button {
    NSInteger tag = button.tag;
    switch (tag) {
        case 1000:
            if (_cant == 0) {
                return;
            }
            _cant--;
            pyrUp(tmp_p, dst_p, cv::Size(tmp_p.cols * 2, tmp_p.rows * 2));
            printf( "** Zoom Out: Image * 2 \n" );
            break;
        case 1001:
            _cant++;
            pyrDown(tmp_p, dst_p, cv::Size(tmp_p.cols / 2, tmp_p.rows / 2));
            printf( "** Zoom In: Image / 2 \n" );
            break;
    }
    _imageView.image = MatToUIImage(dst_p);
    tmp_p = dst_p;
}

- (void)sss {
    Mat src, dst;
    
    UIImage *img = [UIImage imageNamed:@"sss.png"];
    UIImageToMat(img, src);
    
    /// 分割成3个单通道图像 ( R, G 和 B )
    std::vector<Mat> rgb_planes;
    split(src, rgb_planes);
    
    /// 设定bin数目
    int histSize = 255;
    
    /// 设定取值范围 ( R,G,B) )
    float range[] = { 0, 255 } ;
    const float* histRange = { range };
    
    bool uniform = true; bool accumulate = false;
    
    Mat r_hist, g_hist, b_hist;
    
    /// 计算直方图:
    calcHist( &rgb_planes[0], 1, 0, Mat(), r_hist, 1, &histSize, &histRange, uniform, accumulate );
    calcHist( &rgb_planes[1], 1, 0, Mat(), g_hist, 1, &histSize, &histRange, uniform, accumulate );
    calcHist( &rgb_planes[2], 1, 0, Mat(), b_hist, 1, &histSize, &histRange, uniform, accumulate );
    
    // 创建直方图画布
    int hist_w = 400; int hist_h = 400;
    int bin_w = cvRound( (double) hist_w/histSize );
    
    Mat histImage( hist_w, hist_h, CV_8UC3, Scalar( 0,0,0) );
    
    /// 将直方图归一化到范围 [ 0, histImage.rows ]
    normalize(r_hist, r_hist, 0, histImage.rows, NORM_MINMAX, -1, Mat() );
    normalize(g_hist, g_hist, 0, histImage.rows, NORM_MINMAX, -1, Mat() );
    normalize(b_hist, b_hist, 0, histImage.rows, NORM_MINMAX, -1, Mat() );
    
    /// 在直方图画布上画出直方图
    for( int i = 1; i < histSize; i++ )
    {
        line( histImage, cv::Point( bin_w*(i-1), hist_h - cvRound(r_hist.at<float>(i-1)) ) ,
             cv::Point( bin_w*(i), hist_h - cvRound(r_hist.at<float>(i)) ),
             Scalar( 0, 0, 255), 2, 8, 0  );
        line( histImage, cv::Point( bin_w*(i-1), hist_h - cvRound(g_hist.at<float>(i-1)) ) ,
             cv::Point( bin_w*(i), hist_h - cvRound(g_hist.at<float>(i)) ),
             Scalar( 0, 255, 0), 2, 8, 0  );
        line( histImage, cv::Point( bin_w*(i-1), hist_h - cvRound(b_hist.at<float>(i-1)) ) ,
             cv::Point( bin_w*(i), hist_h - cvRound(b_hist.at<float>(i)) ),
             Scalar( 255, 0, 0), 2, 8, 0  );
    }
    
    _imageView.image = MatToUIImage(histImage);
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
