//
//  ChatTableViewController.m
//  Chat Bubbles
//
//  Created by Minh Luu on 2/28/15.
//  Copyright (c) 2015 Minh Luu. All rights reserved.
//

#import "ChatTableViewController.h"
#import "InputViewController.h"
#import "ChatMessage.h"

@interface ChatTableViewController () <UITableViewDataSource, UITableViewDelegate, InputViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *chatTableView;
@property (strong, nonatomic) NSMutableArray *messages;
@property (weak, nonatomic) IBOutlet UIView *inputContainer;

@end

@implementation ChatTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.messages = [@[] mutableCopy];
    
    [self.chatTableView setContentInset:UIEdgeInsetsMake(-64.0, 0.0, 0.0, 0.0)];

    UITapGestureRecognizer *dismissKBTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [self.chatTableView addGestureRecognizer:dismissKBTap];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.chatTableView flashScrollIndicators];
}

- (void)dismissKeyboard:(UITapGestureRecognizer *)tap
{
    [self.view endEditing:YES];
}

//- (void)didReceivedInputText:(NSString *)text {
//    [self.messages addObject:text];
//    [self.chatTableView reloadData];
//}

- (void)didReceivedChatMessage:(ChatMessage *)chatMessage
{
    [self.messages addObject:chatMessage];
    [self.chatTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messages.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Chat Cell" forIndexPath:indexPath];
    ChatMessage *chatMessage = self.messages[indexPath.row];
    cell.textLabel.text = chatMessage.message;
    NSString *timestampString = [NSDateFormatter localizedStringFromDate:chatMessage.timestamp
                                                               dateStyle:NSDateFormatterNoStyle
                                                               timeStyle:NSDateFormatterShortStyle];
    cell.detailTextLabel.text = timestampString;
    return cell;
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Input View Controller"]) {
        InputViewController *inputVC = segue.destinationViewController;
        inputVC.delegate = self;
    }
}

@end
