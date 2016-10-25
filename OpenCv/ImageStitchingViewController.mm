//
//  ImageStitchingViewController.m
//  OpenCv
//
//  Created by Riches on 2016/10/25.
//  Copyright © 2016年 Riches. All rights reserved.
//

#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h> // 禁止引用此头文件 否则冲突
#import <opencv2/stitching.hpp>
#import <opencv2/highgui.hpp>
#import "ImageStitchingViewController.h"
#import "OpenCV_image_handel.h"

using namespace cv;
using namespace std;

@interface ImageStitchingViewController ()

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UIImageView *imageView2;

@end

@implementation ImageStitchingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.width * 2 / 3)];
    [self.view addSubview:_imageView];
    
    self.imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_imageView.frame) + 5, self.view.frame.size.width, self.view.frame.size.width * 2 / 3)];
    [self.view addSubview:_imageView2];
    
    NSArray *arr = @[@"1.jpg", @"2.jpg", @"3.jpg"];
    String dstFile = "";
    vector<Mat> imgs;
    for (int i = 0; i < 3; i++) {
    
        NSString *name = arr[1];
        UIImage *imge = [UIImage imageNamed:name];
        Mat img;
        UIImageToMat(imge, img);
        if (img.empty()) {
            cout<<"Can't read image '"<<arr[i]<<"'\n";
            return;
        }
        imgs.push_back(img);
    }
    Mat pano;
    Stitcher stitcher = Stitcher::createDefault(false);
    Stitcher::Status status = stitcher.stitch(imgs, pano);
    if (status != Stitcher::OK) {
        cout<<"Can't stitch images, error code=" <<int(status)<<endl;
        return;
    }
    imwrite(dstFile, pano);
    
    _imageView.image = MatToUIImage(pano);
}

- (UIImage *)UIImageFromCVMat:(cv::Mat)cvMat {
    NSData *data = [NSData dataWithBytes:cvMat.data length:cvMat.elemSize()*cvMat.total()];
    
    CGColorSpaceRef colorSpace;
    CGBitmapInfo bitmapInfo;
    
    if (cvMat.elemSize() == 1) {
        colorSpace = CGColorSpaceCreateDeviceGray();
        bitmapInfo = kCGImageAlphaNone | kCGBitmapByteOrderDefault;
    } else {
        colorSpace = CGColorSpaceCreateDeviceRGB();
        bitmapInfo = kCGBitmapByteOrder32Little | (
                                                   cvMat.elemSize() == 3? kCGImageAlphaNone : kCGImageAlphaNoneSkipFirst
                                                   );
    }
    
    CGDataProviderRef provider = CGDataProviderCreateWithCFData((__bridge CFDataRef)data);
    
    // Creating CGImage from cv::Mat
    CGImageRef imageRef = CGImageCreate(
                                        cvMat.cols,                 //width
                                        cvMat.rows,                 //height
                                        8,                          //bits per component
                                        8 * cvMat.elemSize(),       //bits per pixel
                                        cvMat.step[0],              //bytesPerRow
                                        colorSpace,                 //colorspace
                                        bitmapInfo,                 // bitmap info
                                        provider,                   //CGDataProviderRef
                                        NULL,                       //decode
                                        false,                      //should interpolate
                                        kCGRenderingIntentDefault   //intent
                                        );
    
    // Getting UIImage from CGImage
    UIImage *finalImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    CGDataProviderRelease(provider);
    CGColorSpaceRelease(colorSpace);
    
    return finalImage; 
}

+ (cv::Mat)cvMatWithImage:(UIImage *)image
{
    CGColorSpaceRef colorSpace = CGImageGetColorSpace(image.CGImage);
    CGFloat cols = image.size.width;
    CGFloat rows = image.size.height;
    
    cv::Mat cvMat(rows, cols, CV_8UC4); // 8 bits per component, 4 channels
    
    CGContextRef contextRef = CGBitmapContextCreate(cvMat.data,                 // Pointer to backing data
                                                    cols,                       // Width of bitmap
                                                    rows,                       // Height of bitmap
                                                    8,                          // Bits per component
                                                    cvMat.step[0],              // Bytes per row
                                                    colorSpace,                 // Colorspace
                                                    kCGImageAlphaNoneSkipLast |
                                                    kCGBitmapByteOrderDefault); // Bitmap info flags
    
    CGContextDrawImage(contextRef, CGRectMake(0, 0, cols, rows), image.CGImage);
    CGContextRelease(contextRef);
    
    return cvMat;
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
