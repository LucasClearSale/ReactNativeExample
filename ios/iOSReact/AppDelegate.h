#import <RCTAppDelegate.h>
#import <UIKit/UIKit.h>
#import "RCTBridgeModule.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,RCTBridgeModule>

@property (nonatomic, strong) UIWindow *window;

@end
