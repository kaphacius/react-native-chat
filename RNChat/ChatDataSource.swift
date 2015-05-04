//
//  ChatDataSource.swift
//  RNChat
//
//  Created by Yurii Zadoianchuk on 04/05/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

import Foundation

@objc class ChatDataSource: NSObject, UICollectionViewDataSource {
    var messages: [ChatMessage]!
    
    override init() {
        messages = [ChatMessage]()
    }
    
    func addMessage(newMessage: ChatMessage) {
        messages.append(newMessage)
    }
    
    subscript(index: Int) -> ChatMessage {
        return messages[index]
    }
    
    @objc func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return count(messages)
    }
    
    @objc func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}