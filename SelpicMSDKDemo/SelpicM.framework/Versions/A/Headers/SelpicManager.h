//
//  SelpicManager.h
//  SelpicSDKDemoMac
//
//  Created by 徐迪华 on 2020/4/15.
//  Copyright © 2020 xdh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DeviceInfoModel.h"
#import "PrintParmModel.h"
#import "RecvDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SelPicDelegate <NSObject>
//Device connection, disconnection, and protocol method for reading and writing data
-(void)RecvDeviceStatus:(RecvDataModel*)recvModel;
//Protocol method for device plug-in power supply
-(void)RecvData:(RecvDataModel*)recvModel;
@end

@interface SelpicManager : NSObject
@property(nonatomic,assign)id<SelPicDelegate> delegate;

//initialization
+(instancetype)sharedManager;
-(void)connectDevice;
-(void)disConnectDevice;
//Get device information
-(void)getDeviceInfo:(void(^)(DeviceInfoModel *info,NSError *error))complite;
//Set printing parameters
-(void)setPrintParam:(PrintParmModel*)parm Complite:(void(^)(NSError *error))complite;
//Send print data
-(void)sendPrintData:(NSImage*)printImage Complite:(void(^)(NSError *error))complite;

@end

NS_ASSUME_NONNULL_END
