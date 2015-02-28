//
//  InputViewController.m
//  Chat Bubbles
//
//  Created by Minh Luu on 2/28/15.
//  Copyright (c) 2015 Minh Luu. All rights reserved.
//

#import "InputViewController.h"
#import "ChatMessage.h"

@interface InputViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;

@end

@implementation InputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.view endEditing:YES];
    return NO;
}

- (IBAction)inputTextFieldChanged:(UITextField *)sender {
//    NSLog(@"%@", sender.text);
    
    if ([sender.text isEqualToString:@""]) {
        self.sendButton.enabled = NO;
    } else {
        self.sendButton.enabled = YES;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)sendPressed:(id)sender {
    NSString *text = self.inputTextField.text;
    
    ChatMessage *chatMessage = [[ChatMessage alloc] initWithMessage:text];
    
//    [self.delegate didReceivedInputText:text];
    [self.delegate didReceivedChatMessage:chatMessage];
    self.inputTextField.text = nil;
    self.sendButton.enabled = NO;
}

@end
