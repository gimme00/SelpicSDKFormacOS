//
//  mainViewController.m
//  SelpicSDKDemoMac
//
//  Created by 徐迪华 on 2020/4/15.
//  Copyright © 2020 xdh. All rights reserved.
//

#import "mainViewController.h"
#import <SelpicM/SelpicM.h>

@interface mainViewController ()<SelPicDelegate>
{
    
    __weak IBOutlet NSButtonCell *BatteryPercentageLab;
    
    __weak IBOutlet NSButton *deviceTypeLab;
    
    __weak IBOutlet NSButton *isChargingLab;
    
    __weak IBOutlet NSButton *versionIndexLab;
    
    __weak IBOutlet NSImageView *disPlayImgview;
}
@end

@implementation mainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    BatteryPercentageLab.enabled = NO;
    deviceTypeLab.enabled = false;
    isChargingLab.enabled = false;
    versionIndexLab.enabled = false;
    
    [SelpicManager sharedManager].delegate = self;
    
}
- (IBAction)getDeviceInfo:(id)sender {
    
    [[SelpicManager sharedManager]getDeviceInfo:^(DeviceInfoModel * _Nonnull info, NSError * _Nonnull error) {
        if (!error) {
            NSLog(@"info-BatteryPercentage:%d",info.BatteryPercentage);
            NSLog(@"info-deviceType:%@",info.deviceType);
            NSLog(@"info-isCharging:%d",info.isCharging);
            NSLog(@"info-versionIndex:%d",info.versionIndex);
            NSString *ischargeStr;
            if (info.isCharging) {
                ischargeStr = @"charging...";
            }else{
                ischargeStr = @"Non-charged";
            }
            [self->BatteryPercentageLab setTitle:[NSString stringWithFormat:@"BatteryPercent:%d%%",info.BatteryPercentage]];
            [self->deviceTypeLab setTitle:[NSString stringWithFormat:@"deviceType:%@",info.deviceType]];
            [self->isChargingLab setTitle:ischargeStr];
            [self->versionIndexLab setTitle:[NSString stringWithFormat:@"version:%d",info.versionIndex]];
        }else{
            NSLog(@"connect failure");
        }
    }];
    
}
- (IBAction)setPrintParamClick:(id)sender {
    PrintParmModel *parModel = [PrintParmModel new];
    parModel.PrtGrayScale = 1;
    parModel.PrtPlusWidth = 6;
    parModel.prtVoltage = 1;
    [[SelpicManager sharedManager]setPrintParam:parModel Complite:^(NSError * _Nonnull error) {
        if (!error) {
            NSLog(@"set PrintParam success!");
        }else{
            NSLog(@"failure!");
        }
    }];
}
- (IBAction)sendPrintData:(id)sender {
    
    NSImage *img = disPlayImgview.image;
    [[SelpicManager sharedManager]sendPrintData:img Complite:^(NSError * _Nonnull error) {
        if (!error) {
            NSLog(@"send data sucess....");
        }else{
            NSLog(@"failure");
        }
    }];
    
}

//设备的连接、断开，以及读写数据的协议方法
// Device connection, disconnection, and protocol method for reading and writing data
-(void)RecvDeviceStatus:(RecvDataModel*)recvModel{
    if (recvModel.deviceStaus == DidWriteData) {
        NSLog(@"deviceStaus:--DidWriteData");
    }else if (recvModel.deviceStaus == DidConnectDevice){
         NSLog(@"deviceStaus:--DidConnectDevice");
    }else if (recvModel.deviceStaus == DidReadData){
         NSLog(@"deviceStaus:--DidReadData");
    }else if (recvModel.deviceStaus == DidDisConnectDevice){
        NSLog(@"deviceStaus:--DidDisConnectDevice");
    }
}
//设备插拔电源的协议方法
//Protocol method for device plug-in power supply
-(void)RecvData:(RecvDataModel*)recvModel{
     NSLog(@"BatteryStatus:%d",recvModel.BatteryStatus);
    if (recvModel.BatteryStatus) {
        NSLog(@"charging...");
    }else{
        NSLog(@"Non-charged state");
    }
}

@end
