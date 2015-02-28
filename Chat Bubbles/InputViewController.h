//
//  InputViewController.h
//  Chat Bubbles
//
//  Created by Minh Luu on 2/28/15.
//  Copyright (c) 2015 Minh Luu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InputViewControllerDelegate <NSObject>

- (void)didReceivedInputText:(NSString *)text;

@end

@interface InputViewController : UIViewController

@property (weak, nonatomic) id<InputViewControllerDelegate> delegate;

@end
