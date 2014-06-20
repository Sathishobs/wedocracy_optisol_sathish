//
//  LandingVCCustomCell.h
//  wedocracy-ios-test-sathish_jdev
//
//  Created by Sathish on 20/06/14.
//  Copyright (c) 2014 Optisol Business Solutions pvt ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LandingVCCustomCell : UITableViewCell
{
    NSString *wishId;
    IBOutlet UILabel *gift;
    IBOutlet UILabel *is_cash;
    IBOutlet UILabel *amount;
    IBOutlet UILabel *store;
    IBOutlet UILabel *item_url;
    IBOutlet UILabel *created;
    IBOutlet UILabel *modified;

    IBOutlet UIImageView *photo;

    IBOutlet UITextView *notes;
}

@property(nonatomic,retain)NSString *wishId;
@property(nonatomic,retain)IBOutlet UILabel *gift;
@property(nonatomic,retain)IBOutlet UILabel *is_cash;
@property(nonatomic,retain)IBOutlet UILabel *amount;
@property(nonatomic,retain)IBOutlet UILabel *store;
@property(nonatomic,retain)IBOutlet UIImageView *photo;
@property(nonatomic,retain)IBOutlet UILabel *item_url;
@property(nonatomic,retain)IBOutlet UITextView *notes;
@property(nonatomic,retain)IBOutlet UILabel *created;
@property(nonatomic,retain)IBOutlet UILabel *modified;
@end
