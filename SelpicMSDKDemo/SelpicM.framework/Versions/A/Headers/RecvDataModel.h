//
//  RecvDataModel.h
//  selpicDemo
//
//  Created by 徐迪华 on 2020/1/6.
//  Copyright © 2020 xdh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    DidWriteData = 1,//Successfully sent data
    DidConnectDevice,//Device connected successfully
    DidReadData,//Read data successfully
    DidDisConnectDevice,//Device disconnected successfully
}DeviceStatus;

@interface RecvDataModel : NSObject
/*
 *Battery status, YES: charging, NO: non-charging state
 */
@property(nonatomic,assign)BOOL BatteryStatus;
/*
 *Device connection status
 */
@property(nonatomic,assign)DeviceStatus deviceStaus;

@end

NS_ASSUME_NONNULL_END
