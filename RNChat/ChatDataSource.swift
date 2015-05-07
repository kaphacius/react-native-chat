//
//  ChatDataSource.swift
//  RNChat
//
//  Created by Yurii Zadoianchuk on 04/05/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

import Foundation

@objc class ChatDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var messages: [ChatMessage]!
    var collectionView: UICollectionView!
    static let kCellIdentifier = "chatMessageCell"
    
    init(сollectionView: UICollectionView) {
        super.init()
        self.collectionView = сollectionView
        self.collectionView.registerClass(ChatMesageCell.self, forCellWithReuseIdentifier: "chatMessageCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        messages = [ChatMessage]()
    }
    
    func addMessage(newMessage: ChatMessage) {
        messages.append(newMessage)
        collectionView.reloadData()
    }
    
    subscript(index: Int) -> ChatMessage {
        return messages[index]
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        println(count(messages))
        return count(messages)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var messageCell =
        collectionView.dequeueReusableCellWithReuseIdentifier(ChatDataSource.kCellIdentifier, forIndexPath: indexPath) as! ChatMesageCell
        messageCell.setUpWithMessage(messages[indexPath.row])
        return messageCell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        var maxWidth = collectionView.frame.width * 0.8
        let atts = [NSFontAttributeName : ChatMesageCell.messageFont]
        var size = (messages[indexPath.row].message as NSString).sizeWithAttributes(atts)
        var rect = (messages[indexPath.row].message as NSString).boundingRectWithSize(CGSizeMake(maxWidth, CGFloat(DBL_MAX)), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: atts, context: nil)
        println(rect.size)
        return rect.size
    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
//    }
}