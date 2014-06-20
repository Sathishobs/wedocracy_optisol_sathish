//
//  BaseViewController.h
//
 


#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "JSONKit.h"
#import "UIView+Toast.h"

#define IS_IPHONE_5 ([[UIScreen mainScreen]bounds].size.height == 568)

@interface BaseViewController : UIViewController {
	
	NSMutableArray* requests;
}

- (ASIHTTPRequest*) requestWithURL:(NSString*) s;
- (ASIFormDataRequest*) formRequestWithURL:(NSString*) s;
- (void) addRequest:(ASIHTTPRequest*)request;
- (void) clearFinishedRequests;
//- (void) cancelRequests;

- (void)LogoutUser;
//- (void)LogoutSocialNetworkInfo;
- (BOOL) connectedToNetwork;
 
+ (NSString *)getUUID;
- (NSString *)getuserId;
- (NSString *)getuserName;
- (NSString *)getuserStatus;
- (NSString *)getphotoType;
- (NSString *)getUnion;
@end
