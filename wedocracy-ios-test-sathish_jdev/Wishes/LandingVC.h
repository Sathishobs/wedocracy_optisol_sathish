//
//  LandingVC.h
//  wedocracy-ios-test-sathish_jdev
//
//  Created by Sathish on 20/06/14.
//  Copyright (c) 2014 Optisol Business Solutions pvt ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MBProgressHUD.h"

@interface LandingVC : BaseViewController<MBProgressHUDDelegate>
{
    __weak IBOutlet UITableView *myTableView;
    
    MBProgressHUD *progress;
}
@end
