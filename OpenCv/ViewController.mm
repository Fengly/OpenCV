//
//  ViewController.m
//  OpenCv
//
//  Created by Riches on 2016/10/15.
//  Copyright © 2016年 Riches. All rights reserved.
//

#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>



#import "ViewController.h"
//
//#import <opencv2/imgproc/imgproc_c.h>
//#import <opencv2/core.hpp>
//#import <opencv2/highgui.hpp>
//#import <opencv2/highgui/highgui.hpp>
//
//
//#import "OpenCV_image_handel.h"

//using namespace cv;

/// 图片合成  http://blog.sina.com.cn/s/blog_74a459380102v1kg.html
/// OpenCV 学习 http://www.opencv.org.cn/forum.php?mod=viewthread&tid=33549

//const int alpha_slider_max = 100;
//int alpha_slider;
//double alpha;
//double beta;
//
//double aa;
//double bb;
int number = 40;

/// Matrices to store images

double w = 500;

@interface ViewController ()


@property (nonatomic, retain) UIImageView *imgView; /** 图像 */
@property (nonatomic, retain) UIImageView *imgView2; /** 图像 */
@property (nonatomic, retain) UIImageView *imgView3; /** 图像 */

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    CGRect rect = CGRectMake(0, 50, self.view.frame.size.width / 2, self.view.frame.size.width / 2);
//    CGRect rect = CGRectMake(0, 50, self.view.frame.size.width / 2, self.view.frame.size.width * 2 / 6);
    CGRect rect = CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.width);
//    CGRect rect = self.view.frame;
    self.imgView = [[UIImageView alloc] initWithFrame:rect];
//    _imgView.clipsToBounds = YES;
//    _imgView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:_imgView];
    
    self.imgView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50 + rect.size.height + 10, rect.size.width * 2, rect.size.height * 2)];
    [self.view addSubview:_imgView2];
    
    self.imgView3 = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_imgView.frame), _imgView.frame.origin.y, _imgView.frame.size.width, _imgView.frame.size.height)];
    [self.view addSubview:_imgView3];
//
//    _imgView.image = [OpenCV_image_handel imageHandelFromOpenCVWithImageName:@"6.jpg" CvtColorCode:CV_RGB2GRAY_OPENCV];
    
    
    

//    UIImage *imag1 = [UIImage imageNamed:@"6.jpg"];
//    UIImage *imag2 = [UIImage imageNamed:@"pj8.jpg"];
//    CGSize size = _imgView.frame.size;
//    UIGraphicsBeginImageContext(size);
//    [imag1 drawInRect:CGRectMake(0, 0, size.width, size.height)];
//    [imag2 drawInRect:CGRectMake(30, 30, size.width - 60, size.height - 60)];
//    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
//    _imgView.image = resultingImage;
//    UIGraphicsEndImageContext();
    
  
    
    
//    double alpha = 0.5, beta, input;
//    cv::Mat src1, src2, dst;
//    
//    std::cout<<" Simple Linear Blender "<<std::endl;
//    std::cout<<"-----------------------"<<std::endl;
//    std::cout<<"* Enter alpha [0-1]: ";
//    std::cin>>input;
//    if (input >= 0.0 && input <= 1.0) {
//        alpha = input;
//    }
//    
//    alpha = 0.8;
//    UIImage *image1 = [UIImage imageNamed:@"a.jpg"];
//    UIImageToMat(image1, src1);
//    UIImage *image2 = [UIImage imageNamed:@"b.jpg"];
//    UIImageToMat(image2, src2);
//    
////    src1 = cv::imread("8.jpg", 0);
////    src2 = cv::imread("6.jpg", 0);
//    if (!src1.data) {
//        printf("Error loding src1 \n");
////        return;
//    }
//    if (!src2.data) {
//        printf("Error loding src2 \n");
////        return;
//    }
////    namedWindow("linear blend", 1);
//    beta = (1.0 - alpha);
//    addWeighted(src1, alpha, src2, beta, 0.0, dst);
////    imshow("linear blend", dst);
////    waitKey(0);
//    
//    _imgView.image = MatToUIImage(dst);
//    _imgView.backgroundColor = [UIColor cyanColor];
////    return;
    
    
    
    
    
//    Mat A, C;    /**< 只创建信息头 */
//    Mat B(A);    /**< 拷贝构造函数 （只拷贝信息头） */
//    C = A;       /**< 赋值 */
//    
////    Mat D (A, Rect(10, 10, 100, 100) );
////    Mat E = A(Range::all(), Range(1, 3));
//    
//    Mat F = A.clone(); /**< 拷贝图像矩阵A到F */
//    
//    Mat G;
//    A.copyTo(G); /**< 拷贝图像矩阵A到G */
//    /**
//     *
//     *   OpenCV函数中输出图像的内存分配是自动完成的（如果不特别指定的话）。
//     *   使用OpenCV的C++接口时不需要考虑内存释放问题。
//     *   赋值运算符和拷贝构造函数（ ctor ）只拷贝信息头。
//     *   使用函数 clone() 或者 copyTo() 来拷贝一副图像的矩阵。
//     */
//    
//    // 构造函数
//    Mat M(2, 2, CV_8UC3, Scalar(0, 0, 255));
//    std::cout << "M = " << std::endl << "" << M << std::endl << std::endl;
//    /** 该行代码表示创建一个行数为2，列数为2的图像，图像元素是8位无符号整数型，3通道,
//        图像的所有像素值被初始化为(0, 0, 255)  OpenCV默认颜色顺序为 BGR
//     *  CV_8UC(n) 自定义通道数 n：通道数
//     */
//    
//    int sz[3] = {2, 2, 3};
//    Mat L(3, sz, CV_8UC(1), Scalar::all(0));
//    /**
//     *  超过两维的矩阵：指定维数，然后传递一个指向一个数组的指针，这个数组包含每个维度的尺寸
//     */
//    
//    // 创建IplImage指针信息头
//    IplImage *iplImg = cvLoadImage("6.jpg", 1);
//    Mat mtx(iplImg);   // convert IplImage* -> Mat
    
    
    
    
//    cv::Mat grayim(600, 800, CV_8UC1);
//    cv::Mat colorim(600, 800, CV_8UC3);
//    // 遍历grayim所有像素 并设置像素值
//    for (int i = 0; i < grayim.rows; ++i) {
//        for (int j = 0; j < grayim.cols; ++j) {
//            grayim.at<uchar>(i, j) = (i + j) % 255;
//        }
//    }
//    // 遍历colorim所有像素 并设置像素值
//    for (int i = 0; i < colorim.rows; ++i) {
//        for (int j = 0; j < colorim.cols; ++j) {
//            cv::Vec3b pixel;
//            pixel[0] = i % 255;  // blue
//            pixel[1] = j % 255;  // green
//            pixel[2] = (i + j) % 255;        // red
//            colorim.at<cv::Vec3b>(i, j) = pixel;
//        }
//    }
    
    
    
    

//    Mat a, b;
//    UIImage *imag1 = [UIImage imageNamed:@"6.jpg"];
//    UIImageToMat(imag1, a);
//////    Sharpen(a, b, 5);
//    _imgView.image = imag1;
////    _imgView2.image = MatToUIImage(b);
//    _imgView2.image = [OpenCV_image_handel imageSharpenWithImageName:@"6.jpg" code:5];
    
    
//    uchar table[256];
//    Mat c = ScanImageAndReduceRandomAccess(a, table);
//    _imgView2.image = MatToUIImage(c);
    
    
    
    
//    double alpha = 0.5;
//    double beta;
//    double input;
//    Mat src1, src2, dst;
//    std::cout<<" Simple Linear Blender "<<std::endl;
//    std::cout<<"-----------------------"<<std::endl;
//    std::cout<<"* Enter alpha [0-1]:0.4";
//    std::cin>>input;
////    if (alpha >= 0 && alpha <= 1) {
////        alpha = input;
////    }
//    
//    UIImage *image1 = [UIImage imageNamed:@"6.jpg"];
//    UIImage *image2 = [UIImage imageNamed:@"8.jpg"];
//    UIImageToMat(image1, src1);
//    UIImageToMat(image2, src2);
//    
//    if( !src1.data ) { printf("Error loading src1 \n"); return; }
//    if( !src2.data ) { printf("Error loading src2 \n"); return; }
//    
//    beta = 1 - alpha;
//    addWeighted(src1, alpha, src2, beta, 0.0, dst);
//    
//    _imgView2.image = MatToUIImage(dst);
//    
//    _imgView.image = image1;
//    _imgView3.image = image2;
    
    
    
    

//    // 改变图片的 对比度和亮度
//    UIImage *image1 = [UIImage imageNamed:@"6.jpg"];
//    UIImageToMat(image1, image);
//    new_image = Mat::zeros(image.size(), image.type());
//    
//    /// 初始化
//    std::cout << " Basic Linear Transforms " << std::endl;
//    std::cout << "-------------------------" << std::endl;
//    std::cout << "* Enter the alpha value [1.0-3.0]: ";
//    std::cin >> alpha;
//    std::cout << "* Enter the beta value [0-100]: ";
//    std::cin >> beta;
//    
//    alpha = 0;
//    beta = 0;
//    
//    UISlider *slider1 = [[UISlider alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_imgView2.frame) + 10, self.view.frame.size.width - 20, 40)];
//    [self.view addSubview:slider1];
//    slider1.value = 1;
//    slider1.minimumValue = 0;
//    slider1.maximumValue = 3;
//    [slider1 addTarget:self action:@selector(slider1Click:) forControlEvents:(UIControlEventValueChanged)];
//    
//    UISlider *slider2 = [[UISlider alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(slider1.frame) + 5, self.view.frame.size.width - 20, 40)];
//    [self.view addSubview:slider2];
//    
//    slider2.value = 0;
//    slider2.minimumValue = 0;
//    slider2.maximumValue = 100;
//    [slider2 addTarget:self action:@selector(slider2Click:) forControlEvents:(UIControlEventValueChanged)];
//    
//    aa = slider1.value;
//    bb = slider2.value;
//    
//    [self h:image hh:new_image s:aa d:bb];
//    
//    _imgView.image = MatToUIImage(image);
//    _imgView2.image = MatToUIImage(new_image);
    
   
    
//    // 坐标 x 和 y
//    cv::Point pt;
//    pt.x = 10;
//    pt.y = 8;
//    // 可写成 Point pt =  Point(10, 8);
//    
//    // 参数颜色值 BGR
//    cv::Scalar(12, 233, 45);
//    
//    Mat atom_image = Mat::zeros(w, w, CV_8SC3);
//    Mat rook_image = Mat::zeros(w, w, CV_8SC3);
//    
//    MyEllipse(atom_image, 0);
//    MyEllipse2(atom_image, 0);
//    rectangle(atom_image,
//              cv::Point(w / 2.0 - w / 64, w / 3.0 + w / 34),
//              cv::Point(w / 2.0 + w / 64, w - 10),
//              Scalar(255, 255, 0),
//              -1,
//              8);
//    
////    MyEllipse( atom_image, 0 );
////    MyEllipse( atom_image, 45 );
////    MyEllipse( atom_image, -45 );
//    
//    /// 1.b. 创建圆
//    MyFilledCircle( atom_image, cv::Point( w/2.0, w/2.0) );
//    
//    /// 2. 画一个赌棍
//    
//    /// 2.a. 创建一个凸多边形
//    MyPolygon( rook_image );
//
//    /// 2.b. 创建矩形
////    rectangle( rook_image,
////              cv::Point( 0, 7*w/8.0 ),
////              cv::Point( w, w),
////              Scalar( 0, 255, 255 ),
////              -1,
////              8 );
//    
////    /// 2.c. 画几条直线
////    MyLine( rook_image, cv::Point( 0, 15*w/16 ), cv::Point( w, 15*w/16 ) );
////    MyLine( rook_image, cv::Point( w/4, 7*w/8 ), cv::Point( w/4, w ) );
////    MyLine( rook_image, cv::Point( w/2, 7*w/8 ), cv::Point( w/2, w ) );
////    MyLine( rook_image, cv::Point( 3*w/4, 7*w/8 ), cv::Point( 3*w/4, w ) );
//    
////    cv::Point point_start = cv::Point(0, 15 * w / 16);
////    cv::Point point_end = cv::Point(w, 15 * w / 16);
//    
//    _imgView.image = MatToUIImage(rook_image);
//    _imgView2.image = MatToUIImage(atom_image);
    
    
    RNG rng(0xFFFFFFFF);  // 创建随机发生器对象
    /// 初始化一个0矩阵
    Mat imag = Mat::zeros(w, w, CV_8UC3);
    Mat image2;
    // 画直线
//    Drawing_Random_Lines(imag, rng);
//    // 画矩形
//    Drawing_Random_Rectangles(imag, rng);
//    /// 画一些弧线
    drawingRandomEllipses(imag, rng);
    /// 在随机的地方绘制文字
    Displaying_Random_Text(imag, rng);
    /// Displaying the big end!
//    Displaying_Big_End(imag, image2, rng);
    /// 将它加载到 UIImageView 上
    _imgView.image = MatToUIImage(imag);
}

static Scalar randomColor( RNG& rng )
{
    int icolor = (unsigned) rng;
    return Scalar( icolor&255, (icolor>>8)&255, (icolor>>16)&255 );
}

void Displaying_Big_End(Mat image, Mat& image2, RNG rng) {
    int lineType = 8;
    cv::Size textsize = getTextSize("OpenCV forever!", CV_FONT_HERSHEY_TRIPLEX, 3, 5, 0);
    cv::Point org((w - textsize.width)/4, (w - textsize.height)/2);
    NSLog(@"+++++++++++%d, %d", org.x, org.y);
    
//    for( int i = 0; i < 255; i += 2 )
//    {
        image2 = image - Scalar::all(10);
        putText( image2, "OpenCV forever!", org, CV_FONT_HERSHEY_TRIPLEX, 3,
                Scalar(0, 122, 255), 5, lineType );
//    }
    
}

void Displaying_Random_Text(Mat& image, RNG rng) {
    int lineType = 8;
    
    for ( int i = 1; i < number; i++ )
    {
        cv::Point org;
        org.x = rng.uniform(0, 501);
        org.y = rng.uniform(0, 501);
        
        putText(image, "LNuo", org, rng.uniform(0,8),
                rng.uniform(0,100) * 0.05 + 0.1, randomColor(rng), rng.uniform(1, 10), lineType);
    }
    
}

void drawingRandomEllipses(Mat& image, RNG rng) {
    int ellipses_lineType = 8;
    cv::Point point;
    cv::Size size;
   
    for (int i = 0; i < number; i++) {
        point.x = rng.uniform(1, 501);
        point.y = rng.uniform(1, 501);
        size.width = rng.uniform(1, 501);
        size.height = rng.uniform(1, 501);
        
        ellipse( image,
                point,
                size,
                rng.uniform(0, 360),
                rng.uniform(0, 360),
                rng.uniform(0, 360),
                randomColor(rng),
                rng.uniform(1, 10),
                ellipses_lineType );
    }
    
}

void Drawing_Random_Rectangles(Mat& image, RNG rng) {
    int rectangles_lineType = 8;
    cv::Point point1, point2;
    for (int i = 0; i < number; i++) {
        point1.x = rng.uniform(1, 501);
        point1.y = rng.uniform(1, 501);
        point2.x = rng.uniform(1, 501);
        point2.y = rng.uniform(1, 501);
        rectangle(image, point1, point2, randomColor(rng), rng.uniform(1, 10), rectangles_lineType);
    }
}

void Drawing_Random_Lines( Mat& image, RNG rng ) {
    int lines_lineType = 8;
    cv::Point point1, point2;
    
    for( int i = 0; i < number; i++ )
    {
        point1.x = rng.uniform(1, 501);
        point1.y = rng.uniform(1, 501);
        point2.x = rng.uniform(1, 501);
        point2.y = rng.uniform(1, 501); // [1, 501)
//        printf("pt1.x = %d, pt1.y = %d\n", pt1.x, pt1.y);
//        printf("🐄🐄pt2.x = %d, pt2.y = %d\n", pt2.x, point2.y);
    
        line(image, point1, point2, randomColor(rng), rng.uniform(1, 10), lines_lineType);
        
    }
}


/** @函数 detectAndDisplay */
void detectAndDisplay( Mat frame )
{
    CascadeClassifier face_cascade;
    CascadeClassifier eyes_cascade;
    std::vector<cv::Rect> faces;
    Mat frame_gray;
    
    cvtColor( frame, frame_gray, CV_BGR2GRAY );
    equalizeHist( frame_gray, frame_gray );
    
    //-- 多尺寸检测人脸
    face_cascade.detectMultiScale( frame_gray, faces, 1.1, 2, 0|CV_HAAR_SCALE_IMAGE, cv::Size(30, 30) );
    
    for( int i = 0; i < faces.size(); i++ )
    {
        cv::Point center( faces[i].x + faces[i].width*0.5, faces[i].y + faces[i].height*0.5 );
        ellipse( frame, center, cv::Size( faces[i].width*0.5, faces[i].height*0.5), 0, 0, 360, Scalar( 255, 0, 255 ), 4, 8, 0 );
        
        Mat faceROI = frame_gray( faces[i] );
        std::vector<cv::Rect> eyes;
        
        //-- 在每张人脸上检测双眼
        eyes_cascade.detectMultiScale( faceROI, eyes, 1.1, 2, 0 |CV_HAAR_SCALE_IMAGE, cv::Size(30, 30) );
        
        for( int j = 0; j < eyes.size(); j++ )
        {
            cv::Point center( faces[i].x + eyes[j].x + eyes[j].width*0.5, faces[i].y + eyes[j].y + eyes[j].height*0.5 );
            int radius = cvRound( (eyes[j].width + eyes[i].height)*0.25 );
            circle( frame, center, radius, Scalar( 255, 0, 0 ), 4, 8, 0 );
        }
    }
    //-- 显示结果图像
//    imshow( window_name, frame );
}



void MyPolygon( Mat img )
{
    int lineType = 8;
    
    /** 创建一些点 */
    cv::Point rook_points[1][3];
    rook_points[0][0] = cv::Point(7 * w / 8.0, 7 * w / 8.0);
    rook_points[0][1] = cv::Point(w - 7 * w / 8.0, 7 * w / 8.0);
    rook_points[0][2] = cv::Point(w - 7 * w / 8.0, w - 7 * w / 8.0);
//    rook_points[0][3] = cv::Point( 11*w/16.0, 13*w/16.0 );
//    rook_points[0][4] = cv::Point( 19*w/32.0, 3*w/8.0 );
//    rook_points[0][5] = cv::Point( 3*w/4.0, 3*w/8.0 );
//    rook_points[0][6] = cv::Point( 3*w/4.0, w/8.0 );
//    rook_points[0][7] = cv::Point( 26*w/40.0, w/8.0 );
//    rook_points[0][8] = cv::Point( 26*w/40.0, w/4.0 );
//    rook_points[0][9] = cv::Point( 22*w/40.0, w/4.0 );
//    rook_points[0][10] = cv::Point( 22*w/40.0, w/8.0 );
//    rook_points[0][11] = cv::Point( 18*w/40.0, w/8.0 );
//    rook_points[0][12] = cv::Point( 18*w/40.0, w/4.0 );
//    rook_points[0][13] = cv::Point( 14*w/40.0, w/4.0 );
//    rook_points[0][14] = cv::Point( 14*w/40.0, w/8.0 );
//    rook_points[0][15] = cv::Point( w/4.0, w/8.0 );
//    rook_points[0][16] = cv::Point( w/4.0, 3*w/8.0 );
//    rook_points[0][17] = cv::Point( 13*w/32.0, 3*w/8.0 );
//    rook_points[0][18] = cv::Point( 5*w/16.0, 13*w/16.0 );
//    rook_points[0][19] = cv::Point( w/4.0, 13*w/16.0) ;
    
    const cv::Point* ppt[1] = {rook_points[0]};
    int npt[] = {3};
    
    fillPoly(img,
             ppt,
             npt,
             1,
             Scalar(255, 255, 255),
             lineType);
}

void MyFilledCircle( Mat img, cv::Point center )
{
    int thickness = -1;
    int lineType = 8;
    
    circle( img,
           cv::Point( w / 2.0, w / 3.0 ),
           w/32.0,
           Scalar( 0, 0, 255 ),
           thickness,
           lineType, 10);
    circle(img, cv::Point( w / 2.0, w / 3.0 ), w/32.0, Scalar( 0, 0, 255 ));
}


void MyEllipse( Mat img, double angle )
{
    int thickness = -1;
    int lineType = 8;
    
    ellipse( img,
            cv::Point( w / 2.0 - w / 5.0, w / 3.0 ),
            cv::Size( w / 5.0, w / 20.0 ),
            angle,
            0,
            360,
            Scalar( 255, 0, 0 ),
            thickness,
            lineType );
}

void MyEllipse2( Mat img, double angle )
{
    int thickness = -1;
    int lineType = 8;
    
    ellipse( img,
            cv::Point( w / 2.0 + w / 5.0, w / 3.0 ),
            cv::Size( w / 5.0, w / 20.0 ),
            angle,
            0,
            360,
            Scalar( 255, 0, 0 ),
            thickness,
            lineType );
}

void MyLine( Mat img, cv::Point start, cv::Point end )
{
    int thickness = 2;
    int lineType = 8;
    line( img,
         start,
         end,
         Scalar( 0, 0, 0 ),
         thickness,
         lineType );
}



- (void)slider1Click:(UISlider *)slider {
    aa = slider.value;
    [self h:image hh:new_image s:aa d:bb];
    
//    _imgView.image = MatToUIImage(image);
    _imgView2.image = MatToUIImage(new_image);
}

- (void)slider2Click:(UISlider *)slider {
    bb = slider.value;
    [self h:image hh:new_image s:aa d:bb];
    
//    _imgView.image = MatToUIImage(image);
    _imgView2.image = MatToUIImage(new_image);
}


- (UIImage *)h:(Mat)image1 hh:(Mat)new_image1 s:(double)alpha d:(double)neta {
    /// 执行运算 new_image(i,j) = alpha*image(i,j) + beta
    for( int i = 0; i < image1.rows; i++) {
        for( int j = 0; j < image1.cols * 1.5; j++) {
            for( int k = 0; k < 3; k++) {
                new_image1.at<Vec3b>(i,j)[k] = saturate_cast<uchar>(alpha * ( image1.at<Vec3b>(i,j)[k]) + neta);
            }
        }
    }
    new_image1.row(0).setTo(Scalar(0));                      // 上
    new_image1.row(new_image1.rows-1).setTo(Scalar(0));       // 下
    new_image1.col(0).setTo(Scalar(0));                      // 左
    new_image1.col(new_image1.cols-1).setTo(Scalar(0));       // 右
    
    return MatToUIImage(new_image);
}

Mat& ScanImageAndReduceRandomAccess(Mat& I, const uchar* const table)
{
    // accept only char type matrices
    CV_Assert(I.depth() != sizeof(uchar));
    
    const int channels = I.channels();
    switch(channels)
    {
        case 1:
        {
            for( int i = 0; i < I.rows; ++i)
                for( int j = 0; j < I.cols; ++j )
                    I.at<uchar>(i,j) = table[I.at<uchar>(i,j)];
            break;
        }
        case 3:
        {
            Mat_<Vec3b> _I = I;
            
            for( int i = 0; i < I.rows; ++i)
                for( int j = 0; j < I.cols; ++j )
                {
                    _I(i,j)[0] = table[_I(i,j)[0]];
                    _I(i,j)[1] = table[_I(i,j)[1]];
                    _I(i,j)[2] = table[_I(i,j)[2]];
                }
            I = _I;
            break;
        }
    }
    
    return I;
}


Mat& ScanImageAndReduceIterator(Mat& I, const uchar* const table)
{
    // accept only char type matrices
    CV_Assert(I.depth() != sizeof(uchar));
    
    const int channels = I.channels();
    switch(channels)
    {
        case 1:
        {
            MatIterator_<uchar> it, end;
            for( it = I.begin<uchar>(), end = I.end<uchar>(); it != end; ++it)
                *it = table[*it];
            break;
        }
        case 3:
        {
            MatIterator_<Vec3b> it, end;
            for( it = I.begin<Vec3b>(), end = I.end<Vec3b>(); it != end; ++it)
            {
                (*it)[0] = table[(*it)[0]];
                (*it)[1] = table[(*it)[1]];
                (*it)[2] = table[(*it)[2]];
            }
        }
    }
    return I;
}

Mat& ScanImageAndReduceC(Mat& I, const uchar* const table) {
    // accept only char type matrices
    CV_Assert(I.depth() != sizeof(uchar));
    int channels = I.channels();
    int nRows = I.rows * channels;
    int nCols = I.cols;
    
    if (I.isContinuous())
    {
        nCols *= nRows;
        nRows = 1;
    }
    int i,j;
    uchar* p;
    for( i = 0; i < nRows; ++i)
    {
        p = I.ptr<uchar>(i);
        for ( j = 0; j < nCols; ++j)
        {
            p[j] = table[p[j]];
        }
    }
    return I; 
}



//void Sharpen(const Mat& myImage, Mat& Result, int n)
//{
//    CV_Assert(myImage.depth() == CV_8U);  // 仅接受uchar图像
//    
//    Result.create(myImage.size(),myImage.type());
//    const int nChannels = myImage.channels();
//    
//    for(int j = 1 ; j < myImage.rows-1; ++j)
//    {
//        const uchar* previous = myImage.ptr<uchar>(j - 1);
//        const uchar* current  = myImage.ptr<uchar>(j    );
//        const uchar* next     = myImage.ptr<uchar>(j + 1);
//        
//        uchar* output = Result.ptr<uchar>(j);
//        
//        for(int i= nChannels; i < nChannels*(myImage.cols-1); ++i)
//        {
//            *output++ = saturate_cast<uchar>(n * current[i]
//                                             - current[i - nChannels] - current[i+nChannels] - previous[i] - next[i]);
//        }
//    }
//    
//    // 边界处理
//    Result.row(0).setTo(Scalar(0));                   // 上
//    Result.row(Result.rows-1).setTo(Scalar(0));       // 下
//    Result.col(0).setTo(Scalar(0));                   // 左
//    Result.col(Result.cols-1).setTo(Scalar(0));       // 右
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
