//
//  ChatMessageCell.swift
//  RNChat
//
//  Created by Yurii Zadoianchuk on 06/05/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

import UIKit

class ChatMesageCell: UICollectionViewCell {
    var messageTextView: UITextView!
    static let messageFont = UIFont(name: "Courier", size: 25.0)!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        messageTextView = UITextView(frame: self.bounds)
        messageTextView.font = ChatMesageCell.messageFont
        contentView.addSubview(messageTextView)
        contentView.backgroundColor = UIColor.yellowColor()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpWithMessage(chatMessage: ChatMessage) {
        messageTextView.text = chatMessage.message
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        messageTextView.frame = self.contentView.bounds
    }
}
