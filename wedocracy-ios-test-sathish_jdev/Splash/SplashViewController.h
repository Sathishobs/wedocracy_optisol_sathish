//
//  SplashViewController.h
//  bis
//
//  Created by Sathish on 28/01/14.
//  Copyright (c) 2014 Optisol Business Solutions pvt ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface SplashViewController : BaseViewController{
    
	NSTimer *timer;
	UIImageView *splashImageView;
}

@property(nonatomic,retain) NSTimer *timer;
@property(nonatomic,retain) UIImageView *splashImageView;

@end
