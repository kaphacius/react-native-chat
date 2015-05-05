//
//  ChatViewManager.m
//  RNChat
//
//  Created by Yurii Zadoianchuk on 05/05/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import "ChatViewManager.h"
#import "RNChat-Swift.h"

@implementation ChatViewManager

- (UIView *)view {
  return [[ChatView alloc] init];
}

RCT_EXPORT_MODULE()

@end
