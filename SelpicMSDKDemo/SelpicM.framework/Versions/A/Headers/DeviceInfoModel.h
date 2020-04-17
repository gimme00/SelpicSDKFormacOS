//
//  DeviceInfoModel.h
//  selpicDemo
//
//  Created by 徐迪华 on 2020/1/3.
//  Copyright © 2020 xdh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DeviceInfoModel : NSObject
/*
 *Device type name  ：S1/S1+
 */
@property(nonatomic,strong)NSString *deviceType;
/*
 *Hardware program version number
 */
@property(nonatomic,assign)int versionIndex;
/*
 *Device battery percentage
 */
@property(nonatomic,assign)int BatteryPercentage;
/*
 *Whether the device is charging
 */
@property(nonatomic,assign)BOOL isCharging;

@end

NS_ASSUME_NONNULL_END
