//
//  SobelViewController.m
//  
//
//  Created by Riches on 2016/10/24.
//
//

#import "SobelViewController.h"

#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>

using namespace cv;

@interface SobelViewController ()

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UIImageView *imageView2;

@end

@implementation SobelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIImage *image = [UIImage imageNamed:@"mm.jpeg"];
//    CGFloat H = image.size.height * self.view.frame.size.width / image.size.width;
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.width * 2 / 3)];
    [self.view addSubview:_imageView];
    
    self.imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_imageView.frame) + 5, self.view.frame.size.width, self.view.frame.size.width * 2 / 3)];
    [self.view addSubview:_imageView2];
    
    /// Load the image
//    UIImage *image = [UIImage imageNamed:@"mm.jpeg"];
//    _imageView2.image = image;
//    
//    Mat src, src_gray;
//    Mat grad;
////    char* window_name = "Sobel Demo - Simple Edge Detector";
//    int scale = 1;
//    int delta = 0;
//    int ddepth = CV_16S;
//    
//    /// 装载图像
//    UIImageToMat(image, src);
//    
//    if( !src.data )
//        GaussianBlur(src, src, cv::Size(3,3), 0, 0, BORDER_DEFAULT);
//    
//    /// 转换为灰度图
//    cvtColor( src, src_gray, CV_RGB2GRAY);
//    
//    /// 创建 grad_x 和 grad_y 矩阵
//    Mat grad_x, grad_y;
//    Mat abs_grad_x, abs_grad_y;
//    
//    /// 求 X方向梯度
//    //Scharr( src_gray, grad_x, ddepth, 1, 0, scale, delta, BORDER_DEFAULT );
//    Sobel( src_gray, grad_x, ddepth, 1, 0, 3, scale, delta, BORDER_DEFAULT );
//    convertScaleAbs( grad_x, abs_grad_x );
//    
//    /// 求Y方向梯度
//    //Scharr( src_gray, grad_y, ddepth, 0, 1, scale, delta, BORDER_DEFAULT );
//    Sobel( src_gray, grad_y, ddepth, 0, 1, 3, scale, delta, BORDER_DEFAULT );
//    convertScaleAbs( grad_y, abs_grad_y );
//    
//    /// 合并梯度(近似)
//    addWeighted( abs_grad_x, 0.5, abs_grad_y, 0.5, 0, grad );
//    
//    _imageView.image = MatToUIImage(grad);
    
    double alpha = 0.5;
    double beta;
    double input;
    Mat src1, src2, dst;
    std::cout<<" Simple Linear Blender "<<std::endl;
    std::cout<<"-----------------------"<<std::endl;
    std::cout<<"* Enter alpha [0-1]:0.4";
    std::cin>>input;
    //    if (alpha >= 0 && alpha <= 1) {
    //        alpha = input;
    //    }
    
    UIImage *image1 = [UIImage imageNamed:@"6.jpg"];
    UIImage *image2 = [UIImage imageNamed:@"8.jpg"];
    UIImageToMat(image1, src1);
    UIImageToMat(image2, src2);

    
    if( !src1.data ) { printf("Error loading src1 \n"); return; }
    if( !src2.data ) { printf("Error loading src2 \n"); return; }
    
    beta = 1 - alpha;
    addWeighted(src1, alpha, src2, beta, 0.0, dst);
    
    _imageView2.image = MatToUIImage(dst);
    
    _imageView.image = image1;
//    _imgView3.image = image2;
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
