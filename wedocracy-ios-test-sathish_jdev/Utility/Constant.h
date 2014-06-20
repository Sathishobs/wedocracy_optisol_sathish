//
//  AppDelegate.h
//  wedocracy-ios-test-sathish_jdev
//
//  Created by Sathish on 20/06/14.
//  Copyright (c) 2014 Optisol Business Solutions pvt ltd. All rights reserved.
//

#define DOMAIN_URL @"http://wedocracy-ios-test.herokuapp.com/client/"
#define DOMAIN_IMG_URL @"http://res.cloudinary.com/hew6ktdno/image/upload/c_fill,h_60,w_60/"

//For ScrollView

static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;
#define SCROLLVIEW_CONTENT_WIDTH  320
#define SCROLLVIEW_CONTENT_HEIGHT 480

#define DEGREES_RADIANS(angle) ((angle) / 180.0 * M_PI)

#define UIColorFromRGB(rgbValue) [UIColor \ colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \ green((float)((rgbValue & 0xFF00) >> 8))/255.0 \ blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// Validation Error
///////////////////////

// Error Header
#define kERROR_ALERT_HEADER @"WedoCracy"

//kPassword missmatch Error
#define kPSWD_MISMATCH @"Entered Password missmatch"

//kForgot password mail  
#define FP_MAIL_FAILD @"Problem sending mail. Please try again."
#define FP_MAIL_SUCCESS @"Reset password link has successfully been sent to your Email Id."
#define kCHANGE_PWD_FAILED @"Failed changing password."

//kMesssage sent success
#define kCONTACT_SENT_MSG @"Message sent. Thank you for your valuable input."

//OK
#define kOK @"OK"
//Close
#define kCLOSE @"Close"
//YES
#define Yes @"YES"

//No item found
#define kNO_ITEM_FOUND @"No items found "

//connectionError
#define kCONNECTION_ERROR @"No Connection Error"
#define kNETWORK_ERROR @"Network Error"
#define INFO_FIND_ERROR @"Error in find information."
#define FACEBOOK_CONNECT_ERROR @"Please Login Facebook"


/////////******* URLS ********//////

// Login with registration
#define kREQUEST_LIST_URL [DOMAIN_URL stringByAppendingString:@"request_index?"]
