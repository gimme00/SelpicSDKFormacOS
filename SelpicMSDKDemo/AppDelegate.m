//
//  AppDelegate.m
//  SelpicMSDKDemo
//
//  Created by 徐迪华 on 2020/4/17.
//  Copyright © 2020 xdh. All rights reserved.
//

#import "AppDelegate.h"
#import "mainViewController.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    mainViewController *main = [[mainViewController alloc] initWithNibName:@"mainViewController" bundle:nil];
    self.window.contentViewController = main;
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
