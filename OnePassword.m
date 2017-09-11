#import "OnePassword.h"
#import "OnePasswordExtension.h"

#import <React/RCTUtils.h>
#import <LocalAuthentication/LocalAuthentication.h>
#import <React/RCTUIManager.h>

@implementation OnePassword

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(isSupported: (RCTResponseSenderBlock)callback)
{
    if ([[OnePasswordExtension sharedExtension] isAppExtensionAvailable]) {
        callback(@[[NSNull null], @true]);
    }
    else {
        callback(@[RCTMakeError(@"OnePassword is not supported.", nil, nil)]);
        return;
    }
}

RCT_EXPORT_METHOD(findLogin: (NSString *)url
                  callback: (RCTResponseSenderBlock)callback)
{
    UIViewController *controller = RCTPresentedViewController();
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[OnePasswordExtension sharedExtension] findLoginForURLString:url
        forViewController:controller sender:nil completion:^(NSDictionary *loginDictionary, NSError *error) {
            if (loginDictionary.count == 0) {
                callback(@[RCTMakeError(@"Error while getting login credentials.", nil, nil)]);
                return;
            }
            
            callback(@[[NSNull null], @{
                           @"username": loginDictionary[AppExtensionUsernameKey],
                           @"password": loginDictionary[AppExtensionPasswordKey]
                           }]);
        }];
    });
}

@end
