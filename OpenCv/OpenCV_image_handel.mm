//
//  OpenCV_image_handel.m
//  OpenCv
//
//  Created by Riches on 2016/10/17.
//  Copyright © 2016年 Riches. All rights reserved.
//

#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>
#import "OpenCV_image_handel.h"
#import "RegularExpressions.h"
//#import <opencv2/cvconfig.h>
using namespace cv;

@implementation OpenCV_image_handel 

+ (UIImage *)imageHandelFromOpenCVWithImageName:(NSString *)nameStr CvtColorCode:(CvtColorCode)code {
    if ([RegularExpressions isUrl:nameStr]) {
        UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:nameStr]]];
        return [OpenCV_image_handel imageHandelWithImage:img CvtColorCode:code];
    } else {
        UIImage *img = [UIImage imageNamed:nameStr];
        return [OpenCV_image_handel imageHandelWithImage:img CvtColorCode:code];
    }
}

+ (UIImage *)imageHandelWithImage:(UIImage *)image CvtColorCode:(CvtColorCode)code {
    cv::Mat cvImage;
    UIImageToMat(image, cvImage);
    if (!cvImage.empty()) {
        cv::Mat gray;
        // 将图像转换为灰度显示
        cv::cvtColor(cvImage, gray, code);
        // 用高斯滤波器去除小的边缘
        cv::GaussianBlur(gray, gray, cv::Size(5, 5), 1.2, 1.2);
        // 计算与画布边缘
        cv::Mat edges;
        cv::Canny(gray, edges, 0, 50);
        // 使用白色填充
        cvImage.setTo(cv::Scalar::all(255));
        // 修改边缘颜色
        cvImage.setTo(cv::Scalar(0, 128, 0, 255), edges);
        // 将Mat转换为Xcode的UIImageView 显示
        return MatToUIImage(cvImage);
    }
    return image;
}



// 图像矩阵的掩码操作
+ (UIImage *)imageSharpenWithImageName:(NSString *)string code:(NSInteger)code {
    Mat myImage, result;
    UIImage *img;
    if ([RegularExpressions isUrl:string]) {
        img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:string]]];
    } else {
        img = [UIImage imageNamed:string];
    }
    UIImageToMat(img, myImage);
    int n = (int)code;
    Sharpen(myImage, result, n);
    return MatToUIImage(result);
}

void Sharpen(const Mat& myImage, Mat& Result, int n) {
    CV_Assert(myImage.depth() == CV_8U);  // 仅接受uchar图像
    Result.create(myImage.size(),myImage.type());
    const int nChannels = myImage.channels();
    
    for(int j = 1 ; j < myImage.rows-1; ++j)
    {
        const uchar* previous = myImage.ptr<uchar>(j - 1);
        const uchar* current  = myImage.ptr<uchar>(j    );
        const uchar* next     = myImage.ptr<uchar>(j + 1);
        
        uchar* output = Result.ptr<uchar>(j);
        
        for(int i= nChannels; i < nChannels*(myImage.cols-1); ++i)
        {
            *output++ = saturate_cast<uchar>(n * current[i]
                                             - current[i - nChannels] - current[i+nChannels] - previous[i] - next[i]);
        }
    }
    
    // 边界处理
    Result.row(0).setTo(Scalar(0));                   // 上
    Result.row(Result.rows-1).setTo(Scalar(0));       // 下
    Result.col(0).setTo(Scalar(0));                   // 左
    Result.col(Result.cols-1).setTo(Scalar(0));       // 右
}


+ (UIImage *)UIImageFromCVMat:(cv::Mat)cvMat {
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

+ (cv::Mat)cvMatWithImage:(UIImage *)image {
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


@end
