//
//  PrintParmModel.h
//  selpicDemo
//
//  Created by 徐迪华 on 2020/1/3.
//  Copyright © 2020 xdh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PrintParmModel : NSObject
/*
 *Print pulse width
 */
@property(nonatomic,assign)int PrtPlusWidth;
/*
 *Print grayscale
 */
@property(nonatomic,assign)int PrtGrayScale;
/*
 *Print voltage
 */
@property(nonatomic,assign)int prtVoltage;

@end

NS_ASSUME_NONNULL_END
