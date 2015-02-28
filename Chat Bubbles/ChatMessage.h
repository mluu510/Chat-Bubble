//
//  ChatMessage.h
//  Chat Bubbles
//
//  Created by Minh Luu on 2/28/15.
//  Copyright (c) 2015 Minh Luu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChatMessage : NSObject

@property (strong, nonatomic) NSString *message;
@property (strong, nonatomic) NSDate *timestamp;


- (instancetype)initWithMessage:(NSString *)message;

@end
