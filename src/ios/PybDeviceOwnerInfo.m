//
//  PybDeviceOwnerInfo.m
//  
//
//  Created by Yanbing Peng on 14/09/15.
//
//
#import "PybDeviceOwnerInfo.h"

@interface PybDeviceOwnerInfo()
@property (nonatomic, strong) NSDictionary * deviceModelByCode;
@end

@implementation PybDeviceOwnerInfo
-(void) getDeviceOwnerInfo:(CDVInvokedUrlCommand *) command
{
    NSString* ownerName = [UIDevice currentDevice].name;
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceModelRaw = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    NSString *deviceModel = [self.deviceModelByCode objectForKey:deviceModelRaw];
    if(!deviceModel) deviceModel = deviceModelRaw;
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK messageAsDictionary: @{@"ownerName":ownerName, @"deviceModel":deviceModel}];
    [self.commandDelegate sendPluginResult:pluginResult callbackId: command.callbackId];
}

-(NSDictionary *)deviceModelByCode
{
    if(!_deviceModelByCode)
    {
        _deviceModelByCode = @{@"i386"      :@"Simulator",
                               @"iPod1,1"   :@"iPod Touch",      // (Original)
                               @"iPod2,1"   :@"iPod Touch",      // (Second Generation)
                               @"iPod3,1"   :@"iPod Touch",      // (Third Generation)
                               @"iPod4,1"   :@"iPod Touch",      // (Fourth Generation)
                               @"iPhone1,1" :@"iPhone",          // (Original)
                               @"iPhone1,2" :@"iPhone",          // (3G)
                               @"iPhone2,1" :@"iPhone",          // (3GS)
                               @"iPad1,1"   :@"iPad",            // (Original)
                               @"iPad2,1"   :@"iPad 2",          //
                               @"iPad3,1"   :@"iPad",            // (3rd Generation)
                               @"iPhone3,1" :@"iPhone 4",        // (GSM)
                               @"iPhone3,3" :@"iPhone 4",        // (CDMA/Verizon/Sprint)
                               @"iPhone4,1" :@"iPhone 4S",       //
                               @"iPhone5,1" :@"iPhone 5",        // (model A1428, AT&T/Canada)
                               @"iPhone5,2" :@"iPhone 5",        // (model A1429, everything else)
                               @"iPad3,4"   :@"iPad",            // (4th Generation)
                               @"iPad2,5"   :@"iPad Mini",       // (Original)
                               @"iPhone5,3" :@"iPhone 5c",       // (model A1456, A1532 | GSM)
                               @"iPhone5,4" :@"iPhone 5c",       // (model A1507, A1516, A1526 (China), A1529 | Global)
                               @"iPhone6,1" :@"iPhone 5s",       // (model A1433, A1533 | GSM)
                               @"iPhone6,2" :@"iPhone 5s",       // (model A1457, A1518, A1528 (China), A1530 | Global)
                               @"iPhone7,1" :@"iPhone 6 Plus",   //
                               @"iPhone7,2" :@"iPhone 6",        //
                               @"iPad4,1"   :@"iPad Air",        // 5th Generation iPad (iPad Air) - Wifi
                               @"iPad4,2"   :@"iPad Air",        // 5th Generation iPad (iPad Air) - Cellular
                               @"iPad4,4"   :@"iPad Mini",       // (2nd Generation iPad Mini - Wifi)
                               @"iPad4,5"   :@"iPad Mini"        // (2nd Generation iPad Mini - Cellular)
                               };
    }
    return _deviceModelByCode;
}
@end
