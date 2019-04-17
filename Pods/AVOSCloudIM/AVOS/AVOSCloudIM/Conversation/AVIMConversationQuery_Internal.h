//
//  AVIMConversationQuery_Internal.h
//  AVOSCloudIM
//
//  Created by Qihe Bian on 2/11/15.
//  Copyright (c) 2015 LeanCloud Inc. All rights reserved.
//

#import "AVIMConversationQuery.h"

@class AVIMClient;

@interface AVIMConversationQuery ()

@property (nonatomic, strong) NSMutableDictionary *where;
@property (nonatomic, strong) NSString *order;
@property (nonatomic, weak) AVIMClient *client;

- (NSString *)whereString;

@end
