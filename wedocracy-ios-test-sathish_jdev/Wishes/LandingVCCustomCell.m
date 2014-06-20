//
//  LandingVCCustomCell.m
//  wedocracy-ios-test-sathish_jdev
//
//  Created by Sathish on 20/06/14.
//  Copyright (c) 2014 Optisol Business Solutions pvt ltd. All rights reserved.
//

#import "LandingVCCustomCell.h"

@interface LandingVCCustomCell ()

@end

@implementation LandingVCCustomCell
@synthesize gift,is_cash,amount,store,item_url,created,modified,photo,notes,wishId;


-(void)dealloc{
    [gift release];
    [is_cash release];
    [amount release];
    [store release];
    [item_url release];
    [item_url release];
    [created release];
    [modified release];
    [photo release];
    [notes release];
    [wishId release];
    [super dealloc];
}
@end
