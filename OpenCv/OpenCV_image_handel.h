//
//  OpenCV_image_handel.h
//  OpenCv
//
//  Created by Riches on 2016/10/17.
//  Copyright © 2016年 Riches. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CvtColorCode) {
    CV_BGR2BGRA_OPENCV = CV_BGR2BGRA,
    CV_RGB2RGBA_OPENCV = CV_RGB2RGBA,
    
    CV_BGRA2BGR_OPENCV = CV_BGRA2BGR,
    CV_RGBA2RGB_OPENCV = CV_RGBA2RGB,
    
    CV_BGR2RGBA_OPENCV = CV_BGR2RGBA,
    CV_RGB2BGRA_OPENCV = CV_RGB2BGRA,
    
    CV_RGBA2BGR_OPENCV = CV_RGBA2BGR,
    CV_BGRA2RGB_OPENCV = CV_BGRA2RGB,
    
    CV_BGR2RGB_OPENCV = CV_BGR2RGB,
    CV_RGB2BGR_OPENCV = CV_RGB2BGR,
    
    CV_BGRA2RGBA_OPENCV = CV_BGRA2RGBA,
    CV_RGBA2BGRA_OPENCV = CV_RGBA2BGRA,
    
    CV_BGR2GRAY_OPENCV = CV_BGR2GRAY,
    CV_RGB2GRAY_OPENCV = CV_RGB2GRAY,
    CV_GRAY2BGR_OPENCV = CV_GRAY2BGR,
    CV_GRAY2RGB_OPENCV = CV_GRAY2RGB,
    CV_GRAY2BGRA_OPENCV = CV_GRAY2BGRA,
    CV_GRAY2RGBA_OPENCV = CV_GRAY2RGBA,
    CV_BGRA2GRAY_OPENCV = CV_BGRA2GRAY,
    CV_RGBA2GRAY_OPENCV = CV_RGBA2GRAY,
    
    CV_BGR2BGR565_OPENCV = CV_BGR2BGR565,
    CV_RGB2BGR565_OPENCV = CV_RGB2BGR565,
    CV_BGR5652BGR_OPENCV = CV_BGR5652BGR,
    CV_BGR5652RGB_OPENCV = CV_BGR5652RGB,
    CV_BGRA2BGR565_OPENCV = CV_BGRA2BGR565,
    CV_RGBA2BGR565_OPENCV = CV_RGBA2BGR565,
    CV_BGR5652BGRA_OPENCV = CV_BGR5652BGRA,
    CV_BGR5652RGBA_OPENCV = CV_BGR5652RGBA,
    
    CV_GRAY2BGR565_OPENCV = CV_GRAY2BGR565,
    CV_BGR5652GRAY_OPENCV = CV_BGR5652GRAY,
    
    CV_BGR2BGR555_OPENCV = CV_BGR2BGR555,
    CV_RGB2BGR555_OPENCV = CV_RGB2BGR555,
    CV_BGR5552BGR_OPENCV = CV_BGR5552BGR,
    CV_BGR5552RGB_OPENCV = CV_BGR5552RGB,
    CV_BGRA2BGR555_OPENCV = CV_BGRA2BGR555,
    CV_RGBA2BGR555_OPENCV = CV_RGBA2BGR555,
    CV_BGR5552BGRA_OPENCV = CV_BGR5552BGRA,
    CV_BGR5552RGBA_OPENCV = CV_BGR5552RGBA,
    
    CV_GRAY2BGR555_OPENCV = CV_GRAY2BGR555,
    CV_BGR5552GRAY_OPENCV = CV_BGR5552GRAY,
    
    CV_BGR2XYZ_OPENCV = CV_BGR2XYZ,
    CV_RGB2XYZ_OPENCV = CV_RGB2XYZ,
    CV_XYZ2BGR_OPENCV = CV_XYZ2BGR,
    CV_XYZ2RGB_OPENCV = CV_XYZ2RGB,
    
    CV_BGR2YCrCb_OPENCV = CV_BGR2YCrCb,
    CV_RGB2YCrCb_OPENCV = CV_RGB2YCrCb,
    CV_YCrCb2BGR_OPENCV = CV_YCrCb2BGR,
    CV_YCrCb2RGB_OPENCV = CV_YCrCb2RGB,
    
    CV_BGR2HSV_OPENCV = CV_BGR2HSV,
    CV_RGB2HSV_OPENCV = CV_RGB2HSV,
    
    CV_BGR2Lab_OPENCV = CV_BGR2Lab,
    CV_RGB2Lab_OPENCV = CV_RGB2Lab,
    
    CV_BayerBG2BGR_OPENCV = CV_BayerBG2BGR,
    CV_BayerGB2BGR_OPENCV = CV_BayerGB2BGR,
    CV_BayerRG2BGR_OPENCV = CV_BayerRG2BGR,
    CV_BayerGR2BGR_OPENCV = CV_BayerGR2BGR,
    
    CV_BayerBG2RGB_OPENCV = CV_BayerBG2RGB,
    CV_BayerGB2RGB_OPENCV = CV_BayerGB2RGB,
    CV_BayerRG2RGB_OPENCV = CV_BayerRG2RGB,
    CV_BayerGR2RGB_OPENCV = CV_BayerGR2RGB,
    
    CV_BGR2Luv_OPENCV = CV_BGR2Luv,
    CV_RGB2Luv_OPENCV = CV_RGB2Luv,
    CV_BGR2HLS_OPENCV = CV_BGR2HLS,
    CV_RGB2HLS_OPENCV = CV_RGB2HLS,
    
    CV_HSV2BGR_OPENCV = CV_HSV2BGR,
    CV_HSV2RGB_OPENCV = CV_HSV2RGB,
    
    CV_Lab2BGR_OPENCV = CV_Lab2BGR,
    CV_Lab2RGB_OPENCV = CV_Lab2RGB,
    CV_Luv2BGR_OPENCV = CV_Luv2BGR,
    CV_Luv2RGB_OPENCV = CV_Luv2RGB,
    CV_HLS2BGR_OPENCV = CV_HLS2BGR,
    CV_HLS2RGB_OPENCV = CV_HLS2RGB,
    
    CV_BayerBG2BGR_VNG_OPENCV = CV_BayerBG2BGR_VNG,
    CV_BayerGB2BGR_VNG_OPENCV = CV_BayerGB2BGR_VNG,
    CV_BayerRG2BGR_VNG_OPENCV = CV_BayerRG2BGR_VNG,
    CV_BayerGR2BGR_VNG_OPENCV = CV_BayerGR2BGR_VNG,
    
    CV_BayerBG2RGB_VNG_OPENCV = CV_BayerBG2RGB_VNG,
    CV_BayerGB2RGB_VNG_OPENCV = CV_BayerGB2RGB_VNG,
    CV_BayerRG2RGB_VNG_OPENCV = CV_BayerRG2RGB_VNG,
    CV_BayerGR2RGB_VNG_OPENCV = CV_BayerGR2RGB_VNG,
    
    CV_BGR2HSV_FULL_OPENCV = CV_BGR2HSV_FULL,
    CV_RGB2HSV_FULL_OPENCV = CV_RGB2HSV_FULL,
    CV_BGR2HLS_FULL_OPENCV = CV_BGR2HLS_FULL,
    CV_RGB2HLS_FULL_OPENCV = CV_RGB2HLS_FULL,
    
    CV_HSV2BGR_FULL_OPENCV = CV_HSV2BGR_FULL,
    CV_HSV2RGB_FULL_OPENCV = CV_HSV2RGB_FULL,
    CV_HLS2BGR_FULL_OPENCV = CV_HLS2BGR_FULL,
    CV_HLS2RGB_FULL_OPENCV = CV_HLS2RGB_FULL,
    
    CV_LBGR2Lab_OPENCV = CV_LBGR2Lab,
    CV_LRGB2Lab_OPENCV = CV_LRGB2Lab,
    CV_LBGR2Luv_OPENCV = CV_LBGR2Luv,
    CV_LRGB2Luv_OPENCV = CV_LRGB2Luv,
    
    CV_Lab2LBGR_OPENCV = CV_Lab2LBGR,
    CV_Lab2LRGB_OPENCV = CV_Lab2LRGB,
    CV_Luv2LBGR_OPENCV = CV_Luv2LBGR,
    CV_Luv2LRGB_OPENCV = CV_Luv2LRGB,
    
    CV_BGR2YUV_OPENCV = CV_BGR2YUV,
    CV_RGB2YUV_OPENCV = CV_RGB2YUV,
    CV_YUV2BGR_OPENCV = CV_YUV2BGR,
    CV_YUV2RGB_OPENCV = CV_YUV2RGB,
    
    CV_BayerBG2GRAY_OPENCV = CV_BayerBG2GRAY,
    CV_BayerGB2GRAY_OPENCV = CV_BayerGB2GRAY,
    CV_BayerRG2GRAY_OPENCV = CV_BayerRG2GRAY,
    CV_BayerGR2GRAY_OPENCV = CV_BayerGR2GRAY,
    
    //YUV 4:2:0 formats family
    CV_YUV2RGB_NV12_OPENCV = CV_YUV2RGB_NV12,
    CV_YUV2BGR_NV12_OPENCV = CV_YUV2BGR_NV12,
    CV_YUV2RGB_NV21_OPENCV = CV_YUV2RGB_NV21,
    CV_YUV2BGR_NV21_OPENCV = CV_YUV2BGR_NV21,
    CV_YUV420sp2RGB_OPENCV = CV_YUV420sp2RGB,
    CV_YUV420sp2BGR_OPENCV = CV_YUV420sp2BGR,
    
    CV_YUV2RGBA_NV12_OPENCV = CV_YUV2RGBA_NV12,
    CV_YUV2BGRA_NV12_OPENCV = CV_YUV2BGRA_NV12,
    CV_YUV2RGBA_NV21_OPENCV = CV_YUV2RGBA_NV21,
    CV_YUV2BGRA_NV21_OPENCV = CV_YUV2BGRA_NV21,
    CV_YUV420sp2RGBA_OPENCV = CV_YUV420sp2RGBA,
    CV_YUV420sp2BGRA_OPENCV = CV_YUV420sp2BGRA,
    
    CV_YUV2RGB_YV12_OPENCV = CV_YUV2RGB_YV12,
    CV_YUV2BGR_YV12_OPENCV = CV_YUV2BGR_YV12,
    CV_YUV2RGB_IYUV_OPENCV = CV_YUV2RGB_IYUV,
    CV_YUV2BGR_IYUV_OPENCV = CV_YUV2BGR_IYUV,
    CV_YUV2RGB_I420_OPENCV = CV_YUV2RGB_I420,
    CV_YUV2BGR_I420_OPENCV = CV_YUV2BGR_I420,
    CV_YUV420p2RGB_OPENCV = CV_YUV420p2RGB,
    CV_YUV420p2BGR_OPENCV = CV_YUV420p2BGR,
    
    CV_YUV2RGBA_YV12_OPENCV = CV_YUV2RGBA_YV12,
    CV_YUV2BGRA_YV12_OPENCV = CV_YUV2BGRA_YV12,
    CV_YUV2RGBA_IYUV_OPENCV = CV_YUV2RGBA_IYUV,
    CV_YUV2BGRA_IYUV_OPENCV = CV_YUV2BGRA_IYUV,
    CV_YUV2RGBA_I420_OPENCV = CV_YUV2RGBA_I420,
    CV_YUV2BGRA_I420_OPENCV = CV_YUV2BGRA_I420,
    CV_YUV420p2RGBA_OPENCV = CV_YUV420p2RGBA,
    CV_YUV420p2BGRA_OPENCV = CV_YUV420p2BGRA,
    
    CV_YUV2GRAY_420_OPENCV = CV_YUV2GRAY_420,
    CV_YUV2GRAY_NV21_OPENCV = CV_YUV2GRAY_NV21,
    CV_YUV2GRAY_NV12_OPENCV = CV_YUV2GRAY_NV12,
    CV_YUV2GRAY_YV12_OPENCV = CV_YUV2GRAY_YV12,
    CV_YUV2GRAY_IYUV_OPENCV = CV_YUV2GRAY_IYUV,
    CV_YUV2GRAY_I420_OPENCV = CV_YUV2GRAY_I420,
    CV_YUV420sp2GRAY_OPENCV = CV_YUV420sp2GRAY,
    CV_YUV420p2GRAY_OPENCV = CV_YUV420p2GRAY,
    
    //YUV 4:2:2 formats family
    CV_YUV2RGB_UYVY_OPENCV = CV_YUV2RGB_UYVY,
    CV_YUV2BGR_UYVY_OPENCV = CV_YUV2BGR_UYVY,
    //CV_YUV2RGB_VYUY = 109,
    //CV_YUV2BGR_VYUY = 110,
    CV_YUV2RGB_Y422_OPENCV = CV_YUV2RGB_Y422,
    CV_YUV2BGR_Y422_OPENCV = CV_YUV2BGR_Y422,
    CV_YUV2RGB_UYNV_OPENCV = CV_YUV2RGB_UYNV,
    CV_YUV2BGR_UYNV_OPENCV = CV_YUV2BGR_UYNV,
    
    CV_YUV2RGBA_UYVY_OPENCV = CV_YUV2RGBA_UYVY,
    CV_YUV2BGRA_UYVY_OPENCV = CV_YUV2BGRA_UYVY,
    //CV_YUV2RGBA_VYUY = 113,
    //CV_YUV2BGRA_VYUY = 114,
    CV_YUV2RGBA_Y422_OPENCV = CV_YUV2RGBA_Y422,
    CV_YUV2BGRA_Y422_OPENCV = CV_YUV2BGRA_Y422,
    CV_YUV2RGBA_UYNV_OPENCV = CV_YUV2RGBA_UYNV,
    CV_YUV2BGRA_UYNV_OPENCV = CV_YUV2BGRA_UYNV,
    
    CV_YUV2RGB_YUY2_OPENCV = CV_YUV2RGB_YUY2,
    CV_YUV2BGR_YUY2_OPENCV = CV_YUV2BGR_YUY2,
    CV_YUV2RGB_YVYU_OPENCV = CV_YUV2RGB_YVYU,
    CV_YUV2BGR_YVYU_OPENCV = CV_YUV2BGR_YVYU,
    CV_YUV2RGB_YUYV_OPENCV = CV_YUV2RGB_YUYV,
    CV_YUV2BGR_YUYV_OPENCV = CV_YUV2BGR_YUYV,
    CV_YUV2RGB_YUNV_OPENCV = CV_YUV2RGB_YUNV,
    CV_YUV2BGR_YUNV_OPENCV = CV_YUV2BGR_YUNV,
    
    CV_YUV2RGBA_YUY2_OPENCV = CV_YUV2RGBA_YUY2,
    CV_YUV2BGRA_YUY2_OPENCV = CV_YUV2BGRA_YUY2,
    CV_YUV2RGBA_YVYU_OPENCV = CV_YUV2RGBA_YVYU,
    CV_YUV2BGRA_YVYU_OPENCV = CV_YUV2BGRA_YVYU,
    CV_YUV2RGBA_YUYV_OPENCV = CV_YUV2RGBA_YUYV,
    CV_YUV2BGRA_YUYV_OPENCV = CV_YUV2BGRA_YUYV,
    CV_YUV2RGBA_YUNV_OPENCV = CV_YUV2RGBA_YUNV,
    CV_YUV2BGRA_YUNV_OPENCV = CV_YUV2BGRA_YUNV,
    
    CV_YUV2GRAY_UYVY_OPENCV = CV_YUV2GRAY_UYVY,
    CV_YUV2GRAY_YUY2_OPENCV = CV_YUV2GRAY_YUY2,
    //CV_YUV2GRAY_VYUY = CV_YUV2GRAY_UYVY,
    CV_YUV2GRAY_Y422_OPENCV = CV_YUV2GRAY_Y422,
    CV_YUV2GRAY_UYNV_OPENCV = CV_YUV2GRAY_UYNV,
    CV_YUV2GRAY_YVYU_OPENCV = CV_YUV2GRAY_YVYU,
    CV_YUV2GRAY_YUYV_OPENCV = CV_YUV2GRAY_YUYV,
    CV_YUV2GRAY_YUNV_OPENCV = CV_YUV2GRAY_YUNV,
    
    // alpha premultiplication
    CV_RGBA2mRGBA_OPENCV = CV_RGBA2mRGBA,
    CV_mRGBA2RGBA_OPENCV = CV_mRGBA2RGBA,
    
    CV_RGB2YUV_I420_OPENCV = CV_RGB2YUV_I420,
    CV_BGR2YUV_I420_OPENCV = CV_BGR2YUV_I420,
    CV_RGB2YUV_IYUV_OPENCV = CV_RGB2YUV_IYUV,
    CV_BGR2YUV_IYUV_OPENCV = CV_BGR2YUV_IYUV,
    
    CV_RGBA2YUV_I420_OPENCV = CV_RGBA2YUV_I420,
    CV_BGRA2YUV_I420_OPENCV = CV_BGRA2YUV_I420,
    CV_RGBA2YUV_IYUV_OPENCV = CV_RGBA2YUV_IYUV,
    CV_BGRA2YUV_IYUV_OPENCV = CV_BGRA2YUV_IYUV,
    CV_RGB2YUV_YV12_OPENCV = CV_RGB2YUV_YV12,
    CV_BGR2YUV_YV12_OPENCV = CV_BGR2YUV_YV12,
    CV_RGBA2YUV_YV12_OPENCV = CV_RGBA2YUV_YV12,
    CV_BGRA2YUV_YV12_OPENCV = CV_BGRA2YUV_YV12,
    
    // Edge-Aware Demosaicing
    CV_BayerBG2BGR_EA_OPENCV = CV_BayerBG2BGR_EA,
    CV_BayerGB2BGR_EA_OPENCV = CV_BayerGB2BGR_EA,
    CV_BayerRG2BGR_EA_OPENCV = CV_BayerRG2BGR_EA,
    CV_BayerGR2BGR_EA_OPENCV = CV_BayerGR2BGR_EA,
    
    CV_BayerBG2RGB_EA_OPENCV = CV_BayerBG2RGB_EA,
    CV_BayerGB2RGB_EA_OPENCV = CV_BayerGB2RGB_EA,
    CV_BayerRG2RGB_EA_OPENCV = CV_BayerRG2RGB_EA,
    CV_BayerGR2RGB_EA_OPENCV = CV_BayerGR2RGB_EA,
    
    CV_COLORCVT_MAX_OPENCV = CV_COLORCVT_MAX
};

@interface OpenCV_image_handel : NSObject

/*!
 @brief openCV 图片处理
 @param nameStr 图片名可以是网址或本地图片
 @param code 枚举
 @return 处理后的图片对象
 */
+ (UIImage *)imageHandelFromOpenCVWithImageName:(NSString *)nameStr CvtColorCode:(CvtColorCode)code;


/*!
 @brief 图像掩码操作  图像磨砂效果
 @param string 图片名可以是网址或本地图片
 @param code   图像的像素改变 code 越大 效果越明显 小于5则图片变灰暗
 @return 处理后的图片对象
 */
+ (UIImage *)imageSharpenWithImageName:(NSString *)string code:(NSInteger)code;

/*!
 @brief Mat 转 UIImage
 @param cvMat 要转化的对象
 @return 处理结果 UIImage 对象
 */
+ (UIImage *)UIImageFromCVMat:(cv::Mat)cvMat;

/*!
 @brief UIImage 转 Mat
 @param image 要转化的对象
 @return 处理结果 cv::Mat 对象
 */
+ (cv::Mat)cvMatWithImage:(UIImage *)image;

@end


