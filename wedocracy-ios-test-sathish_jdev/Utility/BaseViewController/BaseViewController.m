//
//  BaseViewController.m
//

#import "BaseViewController.h"
#import "Reachability.h"

@implementation BaseViewController

#pragma mark -
#pragma mark HTTP requests

- (ASIHTTPRequest*) requestWithURL:(NSString*) s {
	ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:s]];
	[self addRequest:request];
	return request;
}
//
- (ASIFormDataRequest*) formRequestWithURL:(NSString*) s {
	ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:s]];
	[self addRequest:request];
	return request;
}

- (void) addRequest:(ASIHTTPRequest*)request {
	[request setDelegate:self];
	if (!requests) {
		requests = [[NSMutableArray alloc] initWithCapacity:3];
	} else {
		[self clearFinishedRequests];
	}
	[requests addObject:request];
}
//
- (void) clearFinishedRequests {
	NSMutableArray* toremove = [[NSMutableArray alloc] initWithCapacity:[requests count]];
	for (ASIHTTPRequest* r in requests) {
		if ([r isFinished]) {
			[toremove addObject:r];
		}
	}
	
	for (ASIHTTPRequest* r in toremove) {
		[requests removeObject:r];
	}
	[toremove release];
}

- (void) cancelRequests {
	for (ASIHTTPRequest* r in requests) {
		r.delegate = nil;
		[r cancel];
	}	
	[requests removeAllObjects];
}

+ (NSString *)getUUID{
    NSUUID *uuid = [[UIDevice currentDevice] identifierForVendor];
    return [uuid UUIDString];
}

#pragma mark - Logout the user from Tribeit app
-(void)LogoutUser{
    // Reset user info
    NSInteger appNotifyCount = [[NSUserDefaults standardUserDefaults] integerForKey:@"notifyCount"];
    NSString *deviceId = [[NSUserDefaults standardUserDefaults] valueForKey:@"deviceId"];
    NSMutableArray *resultAry = [[NSUserDefaults standardUserDefaults] valueForKey:@"states"];

    // Clear user default value
     NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    
    // Restore Default values
    [[NSUserDefaults standardUserDefaults] setInteger:appNotifyCount forKey:@"notifyCount"];
    [[NSUserDefaults standardUserDefaults] setObject:deviceId forKey:@"deviceId"];
    [[NSUserDefaults standardUserDefaults] setObject:resultAry forKey:@"states"];
}

//-(void)LogoutSocialNetworkInfo{
//    // Logout from facebook
//    [[KDFacebook sharedInstance] logout];
//    
//    // Logout from twitter
//    [[FHSTwitterEngine sharedEngine]clearAccessToken];
//}

- (BOOL) connectedToNetwork{
    BOOL isInternet = NO;
    Reachability* reachability = [Reachability reachabilityWithHostName:@"google.com"];
    NetworkStatus remoteHostStatus = [reachability currentReachabilityStatus];
    
    if(remoteHostStatus == NotReachable)
    {
        isInternet =NO;
    }
    else if (remoteHostStatus == ReachableViaWWAN)
    {
        isInternet = TRUE;
    }
    else if (remoteHostStatus == ReachableViaWiFi)
    { isInternet = TRUE;
        
    }
    return isInternet;
}

//- (void)createCountBadge:(UIView *)myView myText:(NSString *)myText xPosition:(CGFloat) xPosition yPosition:(CGFloat) yPosition {
//    //get size of the text:
//    CGFloat constrainedSize = 265.0f; //or any other size
//    UIFont * myFont = [UIFont boldSystemFontOfSize:12]; //or any other font that matches what you will use in the UILabel
//    CGSize textSize = [myText sizeWithFont: myFont
//                         constrainedToSize:CGSizeMake(constrainedSize, CGFLOAT_MAX)];
//    
//    //create a label:
//    CGRect labelFrame = CGRectMake (xPosition, yPosition, textSize.width+10, textSize.height);
//    UILabel *label = [[UILabel alloc] initWithFrame:labelFrame];
//    //[label setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"footer_img.png"]]];
//    [label setBackgroundColor:[UIColor redColor]];
//    [label setFont:myFont];
//    [label setText:myText];
//    label.textAlignment = NSTextAlignmentCenter;
//    label.layer.borderWidth = 0.1;
//    label.layer.cornerRadius = 5;
//    label.layer.masksToBounds = YES;
//    [label setTextColor:[UIColor whiteColor]];
//    [myView addSubview:label];
//   // [label release];
//}

- (NSString *) getuserId{
   return [[NSUserDefaults standardUserDefaults] valueForKey:@"userId"];
}

- (NSString *) getuserName{
    return [[NSUserDefaults standardUserDefaults] valueForKey:@"userName"];
}

- (NSString *) getuserStatus{
    return [[NSUserDefaults standardUserDefaults] valueForKey:@"userStatus"];
}

- (NSString *) getUnion{
    return [[NSUserDefaults standardUserDefaults] valueForKey:@"union"];
}

-(NSString *) getphotoType{
    return [[NSUserDefaults standardUserDefaults] valueForKey:@"photoType"];
}

#pragma mark UIViewController
- (void) viewDidLoad {
	[super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	//return YES;
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark Memory management

@end
