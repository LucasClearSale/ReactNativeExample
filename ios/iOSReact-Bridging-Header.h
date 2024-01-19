//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#import <UIKit/UIKit.h>

@class CSDocumentoscopyBridget;

@interface CSDocumentoscopyBridget
- (void)callSDKWithNavigation:(UINavigationController *)navigation;
@end


@protocol CSDocumentoscopyBridgetDelegate <NSObject>
- (void)didOpen;
- (void)didTapClose;
- (void)didReceiveErrorWithError:(NSString *)error text:(NSString *)text codeError:(NSInteger)codeError;
- (void)didFinishCaptureWithSessionId:(NSString *)sessionId documentType:(NSString *)documentType;
@end
