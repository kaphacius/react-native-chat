//
//  ChatViewManager.swift
//  RNChat
//
//  Created by Yurii Zadoianchuk on 02/05/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

import Foundation

@objc(ChatViewManager)
class ChatViewManager: RCTViewManager {
    override func view() -> UIView! {
        return ChatView()
    }
}
