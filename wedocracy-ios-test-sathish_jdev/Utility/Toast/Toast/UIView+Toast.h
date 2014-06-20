/***************************************************************************
 
UIView+Toast.h
Toast
Version 1.0

Copyright (c) 2014 Optisol Business.
 
***************************************************************************/


#import <Foundation/Foundation.h>

typedef enum errorStyle{
    CSNotificationViewStyleSuccess,
    CSNotificationViewStyleError,
}CSNotificationViewStyle;

typedef enum position{
    ToastPositionTop,
    ToastPositionCenter,
    ToastPositionBottom,
}tostPosition;

@interface UIView (Toast)

// each makeToast method creates a view and displays it as toast
- (void)makeToast:(NSString *)message errorType:(CSNotificationViewStyle)notificationType;
- (void)makeToast:(NSString *)message duration:(NSTimeInterval)interval position:(id)position errorType:(CSNotificationViewStyle)notificationType;
- (void)makeToast:(NSString *)message duration:(NSTimeInterval)interval position:(id)position image:(UIImage *)image errorType:(CSNotificationViewStyle)notificationType;
- (void)makeToast:(NSString *)message duration:(NSTimeInterval)interval position:(id)position title:(NSString *)title errorType:(CSNotificationViewStyle)notificationType;
- (void)makeToast:(NSString *)message duration:(NSTimeInterval)interval position:(id)position title:(NSString *)title image:(UIImage *)image errorType:(CSNotificationViewStyle)notificationType;

// displays toast with an activity spinner
- (void)makeToastActivity;
- (void)makeToastActivity:(id)position;
- (void)hideToastActivity;

// the showToast methods display any view as toast
- (void)showToast:(UIView *)toast errorType:(CSNotificationViewStyle)notificationType;
- (void)showToast:(UIView *)toast duration:(NSTimeInterval)interval position:(id)point errorType:(CSNotificationViewStyle)notificationType;


@end
