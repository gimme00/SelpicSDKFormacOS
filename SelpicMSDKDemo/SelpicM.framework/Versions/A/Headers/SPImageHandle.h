//
//  SPImageHandle.h
//  PenMaJi
//
//  Created by 李光钧 on 2019/11/14.
//  Copyright © 2019 Arvin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface SPImageHandle : NSObject

+ (NSString *)emojiFolder;
+ (NSString *)photoFolder;
+ (NSString *)emojiThumbFolder;
+ (NSString *)PicFolder;

+ (instancetype)shareHandle;
- (void)loadAllEmojiFromLocalWithType:(NSInteger)type complete:(void (^)(NSArray *))complete;

- (void)fetchImage:(NSString *)imageName complete:(void (^)(NSImage *img))complete;
- (void)fetchThumbImage:(NSString *)imageName complete:(void (^)(NSImage *))complete;

- (void)replaceFaceImages:(NSArray <NSDictionary *> *)images;

@end
