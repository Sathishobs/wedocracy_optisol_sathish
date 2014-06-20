//
//  LandingVC.m
//  wedocracy-ios-test-sathish_jdev
//
//  Created by Sathish on 20/06/14.
//  Copyright (c) 2014 Optisol Business Solutions pvt ltd. All rights reserved.
//

#import "LandingVC.h"
#import "Constant.h"
#import "UIView+Toast.h"
#import "LandingVCCustomCell.h"
#import "UIImageView+WebCache.h"
#import "WishDetailVC.h"

@interface LandingVC ()
{
    NSMutableArray *resultArray;
}
@end

@implementation LandingVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [resultArray count];
}

#pragma mark - Loadind the wishes list
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier_iPhone = @"LandingVCCustomCell";
    
    LandingVCCustomCell *cell = (LandingVCCustomCell *) [myTableView dequeueReusableCellWithIdentifier:CellIdentifier_iPhone];
    
    if (cell == nil) {
        NSArray *topLevelObject = [[NSBundle mainBundle]loadNibNamed:CellIdentifier_iPhone owner:self options:nil];
        cell = [topLevelObject objectAtIndex:0];
    }
    NSDictionary *data = (NSDictionary *)[resultArray objectAtIndex:indexPath.row];
    NSDictionary *wish = [(NSDictionary *)data objectForKey:@"Wish"];
    
    // Feeding data
    cell.wishId = [wish objectForKey:@"id"];
    cell.gift.text = [wish objectForKey:@"gift"];
    
    // Set Wish Image
    NSString *photoData = [DOMAIN_IMG_URL stringByAppendingString:[wish objectForKey:@"photo"]!= [NSNull null]?[wish objectForKey:@"photo"]:@""];
    NSURL *imgUrl = [NSURL URLWithString:photoData];
    [cell.photo setImageWithURL:imgUrl placeholderImage:[UIImage imageNamed:@"download.jpeg"]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSDictionary *data = (NSDictionary *)[resultArray objectAtIndex:indexPath.row];
    NSDictionary *wish = [(NSDictionary *)data objectForKey:@"Wish"];
    
    // Directing to the Wish details screen
    WishDetailVC *viewController = nil;
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        viewController = [[[WishDetailVC alloc]initWithNibName:@"WishDetailVC_iPad" bundle:[NSBundle mainBundle]]autorelease];
    }else{
        viewController = [[[WishDetailVC alloc]initWithNibName:@"WishDetailVC" bundle:[NSBundle mainBundle]]autorelease];
    }
    viewController.wishData = wish;
    [self.navigationController pushViewController:viewController animated:YES];
}

/////////////////////////////////////////////////////////////////////////////
// Do Webservice call for requesting resources
/////////////////////////////////////////////////////////////////////////////

// Do WebService Request asynchronously
-(void)doRequestService:(NSString *)url tag:(int)reqTag{
    [progress hide:YES];
    ASIHTTPRequest *req = [self requestWithURL:url];
    [req setDidFinishSelector:@selector(didFinishRequest:)];
    [req setDidFailSelector:@selector(didFailRequest:)];
    req.timeOutSeconds = 30;
    req.tag = reqTag;
    [req startAsynchronous];
    
    // Do any additional setup after loading the view from its nib.
    [self showProgressWithGradient];
}

#pragma show progress window
- (void)showProgressWithGradient{
    progress = [[[MBProgressHUD alloc] init] initWithView:self.view];
    [self.view addSubview:progress];
    
    progress.dimBackground = YES;
    
    // Regiser for HUD callbacks so we can remove it from the window at the right time
    progress.delegate = self;
    
    // Show the HUD while the provided method executes in a new thread
    [progress show:YES];
}

#pragma mark - request Finished With Success
- (void)didFinishRequest:(ASIHTTPRequest *)finishedRequest{
    NSDictionary *statusInDictionary = nil;
    NSString* responseString = [finishedRequest responseString];
    NSString *status = @"-1";
    NSDictionary *data;
    [progress hide:YES];
    
    statusInDictionary = ( NSDictionary *)[responseString objectFromJSONString];
    if ([statusInDictionary count] >= 1) {
        data = (NSDictionary *)[statusInDictionary objectForKey:@"status"];
        status = [NSString stringWithFormat:@"%@",[data objectForKey:@"status"]];
    }
    @try {
        // Handling the error
        if ([@"-1" isEqualToString:status]) {
            
            
        }
        // Load result
        if (finishedRequest.tag == 0) {
            // if retain count is exist for result array remove it and make it 0
            if (resultArray) {
                resultArray = nil;
                [resultArray release];
            }
            
            resultArray = [[NSMutableArray alloc]initWithArray:[statusInDictionary objectForKey:@"wishes"]];
            [myTableView reloadData];
        }
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
}

#pragma mark - request Finished With Fail
-(void)didFailRequest:(ASIHTTPRequest *)failedRequest{
    [progress hide:YES];
    NSError *error = [failedRequest error];
    if ([error code] == kCFURLErrorNotConnectedToInternet)
	{
        // if we can identify the error, we can present a more precise message to the user.
        NSDictionary *_userInfo = [NSDictionary dictionaryWithObject:kCONNECTION_ERROR
                                                              forKey:NSLocalizedDescriptionKey];
        NSError *noConnectionError = [NSError errorWithDomain:NSCocoaErrorDomain
														 code:kCFURLErrorNotConnectedToInternet
													 userInfo:_userInfo];
        [self handleError:noConnectionError];
    }
	else
	{
        // otherwise handle the error generically
        [self handleError:error];
    }
}

- (void)handleError:(NSError *)error
{
    NSString *errorMessage = [error localizedDescription];
    [self.view makeToast:errorMessage
                duration:3.5
                position:ToastPositionTop
                   image:nil errorType:CSNotificationViewStyleError];
}

// Preload the data for UIview controller
- (void)preLoad{
    
    // Set Title
    self.navigationItem.title = @"MY WISHES";
    // Call Webservice for listing wishes
    NSURL *url = [NSURL URLWithString:kREQUEST_LIST_URL];
    NSString *utlString = [NSString stringWithFormat:@"%@",url];
    [self doRequestService:utlString tag:0];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Initiate the data in view
    [self preLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
