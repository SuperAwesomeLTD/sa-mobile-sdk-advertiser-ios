/**
 * @Copyright:   SuperAwesome Trading Limited 2017
 * @Author:      Gabriel Coman (gabriel.coman@superawesome.tv)
 */

#import <UIKit/UIKit.h>
#import "SAdvUnityCallback.h"
#import <SuperAwesomeAdvertiser/SAVerifyInstall.h>

extern "C" {
    
    /**
     * Unity to native iOS method that sends a CPI event.
     */
    void SuperAwesomeAdvertiserUnitySAVerifyInstall () {
         
        [[SAVerifyInstall getInstance] handleInstall:^(BOOL success) {
            sendCPICallback(@"SAVerifyInstall", success, @"HandleInstall");
        }];
    }
}
