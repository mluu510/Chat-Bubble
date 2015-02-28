//
//  InputViewController.h
//  Chat Bubbles
//
//  Created by Minh Luu on 2/28/15.
//  Copyright (c) 2015 Minh Luu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChatMessage;

@protocol InputViewControllerDelegate <NSObject>

//- (void)didReceivedInputText:(NSString *)text;
- (void)didReceivedChatMessage:(ChatMessage *)chatMessage;

@end

@interface InputViewController : UIViewController

@property (weak, nonatomic) id<InputViewControllerDelegate> delegate;

@end
