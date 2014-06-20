//
//  WishDetailVC.m
//  wedocracy-ios-test-sathish_jdev
//
//  Created by Sathish on 20/06/14.
//  Copyright (c) 2014 Optisol Business Solutions pvt ltd. All rights reserved.
//

#import "WishDetailVC.h"
#import "UIImageView+WebCache.h"
#import "Constant.h"

@interface WishDetailVC ()

@end

@implementation WishDetailVC
@synthesize wishData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// Loading pre feeding datas for wish list view control
- (void)preLoad{
    
    // Set title
    wishId = [wishData objectForKey:@"id"];
    self.navigationItem.title = [NSString stringWithFormat:@"  WISH-%@",wishId];
    
    @try {
        gift.text = [wishData objectForKey:@"notes"] != [NSNull null]?[wishData objectForKey:@"gift"]:@"";
        is_cash.text = [wishData objectForKey:@"is_cash"] == false?@"TRUE":@"False";
        amount.text = [wishData objectForKey:@"amount"] != [NSNull null]?[wishData objectForKey:@"amount"]:@"";
        store.text = [wishData objectForKey:@"store"]!= [NSNull null]?[wishData objectForKey:@"store"]:@"";
        item_url.text = [wishData objectForKey:@"item_url"]!= [NSNull null]?[wishData objectForKey:@"item_url"]:@"";
        notes.text = [wishData objectForKey:@"notes"]!= [NSNull null]?[wishData objectForKey:@"notes"]:@"";
        created.text = [wishData objectForKey:@"created"]!= [NSNull null]?[wishData objectForKey:@"created"]:@"";
        modified.text = [wishData objectForKey:@"modified"]!= [NSNull null]?[wishData objectForKey:@"modified"]:@"";
        
        // Set Wish Image
        NSString *photoData = [DOMAIN_IMG_URL stringByAppendingString:[wishData objectForKey:@"photo"]!= [NSNull null]?[wishData objectForKey:@"photo"]:@""];
        NSURL *imgUrl = [NSURL URLWithString:photoData];
        [photo setImageWithURL:imgUrl placeholderImage:[UIImage imageNamed:@"download.jpeg"]];

    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception);
    }
    @finally {
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [self preLoad];
}

- (void)viewWillDisappear:(BOOL)animated{
    [wishData release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
