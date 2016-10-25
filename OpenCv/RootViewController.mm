//
//  RootViewController.m
//  OpenCv
//
//  Created by Riches on 2016/10/20.
//  Copyright © 2016年 Riches. All rights reserved.
//

#import "RootViewController.h"

#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>

using namespace cv;

int number = 40;
double w = 500;

@interface RootViewController ()

@property (nonatomic, retain) UIImageView *imgView; /** 图像 */
@property (nonatomic, retain) UIImageView *imgView2; /** 图像 */
@property (nonatomic, retain) UIImageView *imgView3; /** 图像 */

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //    CGRect rect = CGRectMake(0, 50, self.view.frame.size.width / 2, self.view.frame.size.width / 2);
        CGRect rect = CGRectMake(0, 50, self.view.frame.size.width / 2, self.view.frame.size.width * 2 / 6);
//    CGRect rect = CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.width);
    //    CGRect rect = self.view.frame;
    self.imgView = [[UIImageView alloc] initWithFrame:rect];
    //    _imgView.clipsToBounds = YES;
    //    _imgView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:_imgView];
    
    self.imgView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50 + rect.size.height + 10, rect.size.width * 2, rect.size.height * 2)];
    [self.view addSubview:_imgView2];
    
    self.imgView3 = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_imgView.frame), _imgView.frame.origin.y, _imgView.frame.size.width, _imgView.frame.size.height)];
    [self.view addSubview:_imgView3];
    
//    RNG rng(0xFFFFFFFF);  // 创建随机发生器对象
//    /// 初始化一个0矩阵
//    Mat imag = Mat::zeros(w, w, CV_8UC3);
//    Mat image2;
//    // 画直线
//    //    Drawing_Random_Lines(imag, rng);
//    //    // 画矩形
//    //    Drawing_Random_Rectangles(imag, rng);
//    //    /// 画一些弧线
//    /// 在随机的地方绘制文字
//    Displaying_Random_Text(imag, rng);
//    /// Displaying the big end!
////        Displaying_Big_End(imag, image2, rng);
//    /// 将它加载到 UIImageView 上
//    _imgView.image = MatToUIImage(imag);
    
    UIImage *image = [UIImage imageNamed:@"6.jpg"];
    Mat imag;
    UIImageToMat(image, imag);
//    Mat imag = imread("8.jpg", CV_LOAD_IMAGE_GRAYSCALE);
    imag.flags = CV_LOAD_IMAGE_GRAYSCALE;
    Mat padded;                            //expand input image to optimal size
    int m = getOptimalDFTSize( imag.rows );
    int n = getOptimalDFTSize( imag.cols ); // on the border add zero values
    copyMakeBorder(imag, padded, 0, m - imag.rows, 0, n - imag.cols, BORDER_CONSTANT, Scalar::all(0));
    
    Mat planes[] = {Mat_<float>(padded), Mat::zeros(padded.size(), CV_32F)};
    Mat complexI;
    merge(planes, 2, complexI);         // Add to the expanded another plane with zeros
    
    dft(complexI, complexI);            // this way the result may fit in the source matrix
    
    // compute the magnitude and switch to logarithmic scale
    // => log(1 + sqrt(Re(DFT(I))^2 + Im(DFT(I))^2))
    split(complexI, planes);                   // planes[0] = Re(DFT(I), planes[1] = Im(DFT(I))
    magnitude(planes[0], planes[1], planes[0]);// planes[0] = magnitude
    Mat magI = planes[0];
    
    magI += Scalar::all(1);                    // switch to logarithmic scale
    log(magI, magI);
    
    // crop the spectrum, if it has an odd number of rows or columns
    magI = magI(cv::Rect(0, 0, magI.cols & -2, magI.rows & -2));
    
    // rearrange the quadrants of Fourier image  so that the origin is at the image center
    int cx = magI.cols/2;
    int cy = magI.rows/2;
    
    Mat q0(magI, cv::Rect(0, 0, cx, cy));   // Top-Left - Create a ROI per quadrant
    Mat q1(magI, cv::Rect(cx, 0, cx, cy));  // Top-Right
    Mat q2(magI, cv::Rect(0, cy, cx, cy));  // Bottom-Left
    Mat q3(magI, cv::Rect(cx, cy, cx, cy)); // Bottom-Right
    
    Mat tmp;                           // swap quadrants (Top-Left with Bottom-Right)
    q0.copyTo(tmp);
    q3.copyTo(q0);
    tmp.copyTo(q3);
    
    q1.copyTo(tmp);                    // swap quadrant (Top-Right with Bottom-Left)
    q2.copyTo(q1);
    tmp.copyTo(q2);
    
    normalize(magI, magI, 0, 1, CV_MINMAX); // Transform the matrix with float values into a
    // viewable image form (float between values 0 and 1).
    _imgView.image = MatToUIImage(imag);
    _imgView3.image = MatToUIImage(magI);
}

//static Scalar randomColor( RNG& rng )
//{
//    int icolor = (unsigned) rng;
//    return Scalar( icolor&255, (icolor>>8)&255, (icolor>>16)&255 );
//}

void Displaying_Big_End(Mat image, Mat& image2, RNG rng) {
    int lineType = 8;
    cv::Size textsize = getTextSize("OpenCV forever!", CV_FONT_HERSHEY_TRIPLEX, 3, 5, 0);
    cv::Point org(10, w - 20);
    NSLog(@"+++++++++++%d, %d", textsize.width, org.y);
    
    //    for( int i = 0; i < 255; i += 2 )
    //    {
    image2 = image - Scalar::all(10);
    putText( image2, "OpenCV forever!", org, CV_FONT_HERSHEY_TRIPLEX, 1,
            Scalar(0, 122, 255), 1, lineType );
    //    }
    
}

void Displaying_Random_Text(Mat& image, RNG rng) {
    int lineType = 8;
    
//    for ( int i = 1; i < number; i++ )
//    {
    cv::Point org;
    org.x = 20;
    org.y = 300;
    
    putText(image,
            "FLNuo",
            org,
            CV_FONT_HERSHEY_SCRIPT_SIMPLEX,
            5,
            Scalar(125, 100, 155),
            2,
            lineType,
            false);
//    }
    
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
