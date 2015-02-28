//
//  ChatMessage.m
//  Chat Bubbles
//
//  Created by Minh Luu on 2/28/15.
//  Copyright (c) 2015 Minh Luu. All rights reserved.
//

#import "ChatMessage.h"

@implementation ChatMessage

- (instancetype)initWithMessage:(NSString *)message
{
    if (self = [super init]) {
        self.message = message;
        self.timestamp = [NSDate date];
    }
    return self;
}

@end
