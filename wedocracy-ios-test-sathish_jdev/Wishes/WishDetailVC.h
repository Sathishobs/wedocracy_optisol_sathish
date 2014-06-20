//
//  WishDetailVC.h
//  wedocracy-ios-test-sathish_jdev
//
//  Created by Sathish on 20/06/14.
//  Copyright (c) 2014 Optisol Business Solutions pvt ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface WishDetailVC : BaseViewController
{
    NSString *wishId;
   __weak IBOutlet UILabel *gift;
   __weak IBOutlet UILabel *is_cash;
   __weak IBOutlet UILabel *amount;
   __weak IBOutlet UILabel *store;
   __weak IBOutlet UILabel *item_url;
   __weak IBOutlet UILabel *created;
   __weak IBOutlet UILabel *modified;
    
   __weak IBOutlet UIImageView *photo;
    
   __weak IBOutlet UITextView *notes;
    
    NSDictionary *wishData;
}

@property(nonatomic,retain)NSDictionary *wishData;
@end
