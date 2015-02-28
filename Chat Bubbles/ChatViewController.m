//
//  ViewController.m
//  Chat Bubbles
//
//  Created by Minh Luu on 2/28/15.
//  Copyright (c) 2015 Minh Luu. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contrainerViewBottomVerticalSpacing;
@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer *dismissKBTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [self.view addGestureRecognizer:dismissKBTap];
    
    [self registerForKeyboardNotifications];
}

- (void)dismissKeyboard:(id)sender
{
    [self.view endEditing:YES];
}

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeShown:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardChangeFrame:)
//                                                 name:UIKeyboardWillChangeFrameNotification
//                                               object:nil];
    
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWillBeShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbEndSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    NSNumber *durationNumber = info[UIKeyboardAnimationDurationUserInfoKey];
    
    [self.view layoutIfNeeded];
    self.contrainerViewBottomVerticalSpacing.constant = kbEndSize.height;
    
    [UIView animateWithDuration:durationNumber.doubleValue animations:^{
        [self.view layoutIfNeeded];
    }];
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    NSLog(@"will be hidden called");
    NSDictionary* info = [aNotification userInfo];
    NSNumber *durationNumber = info[UIKeyboardAnimationDurationUserInfoKey];
    
    [self.view layoutIfNeeded];
    self.contrainerViewBottomVerticalSpacing.constant = 0.0;
    [UIView animateWithDuration:durationNumber.doubleValue animations:^{
        [self.view layoutIfNeeded];
    }];
}

//- (void)keyboardChangeFrame:(NSNotification *)aNotification
//{
//    NSDictionary *info = [aNotification userInfo];
//    CGSize kbSizeEnd = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
//    CGSize kbSizeBegin = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
//    
//    NSLog(@"Begin: %@", NSStringFromCGSize(kbSizeBegin));
//    NSLog(@"End: %@", NSStringFromCGSize(kbSizeEnd));
//    
//    
//    [self.view layoutIfNeeded];
//    self.contrainerViewBottomVerticalSpacing.constant = kbSizeBegin.height;
//    
//    [UIView animateWithDuration:0.0 animations:^{
//        [self.view layoutIfNeeded];
//    }];
//}

@end
