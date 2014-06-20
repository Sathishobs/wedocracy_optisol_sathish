//
//  SplashViewController.m
//  bis
//
//  Created by Sathish on 28/01/14.
//  Copyright (c) 2014 Optisol Business Solutions pvt ltd. All rights reserved.
//

#import "SplashViewController.h"

@implementation SplashViewController

@synthesize timer,splashImageView;

/*
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
 // Custom initialization
 }
 return self;
 }
 */

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
    
    // Init the view
	CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
	UIView *view = [[UIView alloc] initWithFrame:appFrame];
	view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
	self.view = view;
    UIImageView *logo = nil;
    
    if(UI_USER_INTERFACE_IDIOM() ==  UIUserInterfaceIdiomPad){
        splashImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
        splashImageView.frame = CGRectMake(0, 0,1027,768);
        logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
        logo.frame = CGRectMake(60, 183, 246, 76);
    }else if(IS_IPHONE_5){
        splashImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"page_bg"]];
        splashImageView.frame = CGRectMake(0, 0, 320, 568);
        logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
        logo.frame = CGRectMake(40, 235, 238, 59);
    }else{
        splashImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"page_bg"]];
        splashImageView.frame = CGRectMake(0, 0, 320, 480);
        logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
        logo.frame = CGRectMake(40, 190, 238, 59);
    }
    [splashImageView addSubview:logo];
	[self.view addSubview:splashImageView];
    
   	timer = [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(fadeScreen) userInfo:nil repeats:NO];
}

-(void) onTimer{
	NSLog(@"LOAD");
}

- (void)fadeScreen
{
	[UIView beginAnimations:nil context:nil]; // begins animation block
	[UIView setAnimationDuration:0.75];        // sets animation duration
	[UIView setAnimationDelegate:self];        // sets delegate for this block
	[UIView setAnimationDidStopSelector:@selector(finishedFading)];   // calls the finishedFading method when the animation is done (or done fading out)
	self.view.alpha = 0.0;       // Fades the alpha channel of this view to "0.0" over the animationDuration of "0.75" seconds
	[UIView commitAnimations];   // commits the animation block.  This Block is done.
}

- (void) finishedFading
{
	[UIView beginAnimations:nil context:nil]; // begins animation block
	[UIView setAnimationDuration:0.75];        // sets animation duration
	self.view.alpha = 1.0;   // fades the view to 1.0 alpha over 0.75 seconds
	[UIView commitAnimations];   // commits the animation block.  This Block is done.
	[splashImageView removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

- (void)dealloc {
    [super dealloc];
}


@end
