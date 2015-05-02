//
//  ChatView.swift
//  TestProject
//
//  Created by Yurii Zadoianchuk on 02/05/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

import UIKit

class ChatView: RCTView {
    var chatCollectionView: UICollectionView!
    var inputToolbar: UIToolbar!
    var inputTextView: UITextView!
    var sendButton: UIButton!
    
    let kToolbarHeight: CGFloat = 44.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        chatCollectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewLayout())
        chatCollectionView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.addSubview(chatCollectionView)
        inputToolbar = UIToolbar(frame: CGRectZero)
        inputToolbar.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.addSubview(inputToolbar)
        inputTextView = UITextView(frame: CGRectZero)
        inputTextView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.inputToolbar.addSubview(inputTextView)
        sendButton = UIButton(frame: CGRectZero)
        sendButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        sendButton.setTitle("Send", forState: UIControlState.Normal)
        sendButton.backgroundColor = UIColor.blueColor()
        sendButton.sizeToFit()
        self.inputToolbar.addSubview(sendButton)
        
        var inputToolbarHeight = NSLayoutConstraint(item: inputToolbar, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: kToolbarHeight)
        var inputToolbarLeading = NSLayoutConstraint(item: inputToolbar, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0)
        var inputToolbarTrailing = NSLayoutConstraint(item: inputToolbar, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0)
        var inputToolbarBottom = NSLayoutConstraint(item: inputToolbar, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0)
        self.addConstraints([inputToolbarLeading, inputToolbarTrailing, inputToolbarBottom])
        inputToolbar.addConstraint(inputToolbarHeight)
        
        var collectionViewTop = NSLayoutConstraint(item: chatCollectionView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0);
        var collectionViewBottom = NSLayoutConstraint(item: chatCollectionView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: inputToolbar, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0)
        var collectionViewLeading = NSLayoutConstraint(item: chatCollectionView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0)
        var collectionViewTrailing = NSLayoutConstraint(item: chatCollectionView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.RightMargin, multiplier: 1.0, constant: 0.0)
        self.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.addConstraints([collectionViewTop, collectionViewBottom, collectionViewLeading, collectionViewTrailing])
        
        var sendButtonTop = NSLayoutConstraint(item: sendButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: inputToolbar, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0)
        var sendButtonBottom = NSLayoutConstraint(item: sendButton, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: inputToolbar, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0)
        var sendButtonTrailing = NSLayoutConstraint(item: sendButton, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: inputToolbar, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0)
        var sendButtonWidth = NSLayoutConstraint(item: sendButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: sendButton.frame.width)
        inputToolbar.addConstraints([sendButtonTop, sendButtonBottom, sendButtonTrailing])
        sendButton.addConstraint(sendButtonWidth)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillHideNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillChangeFrame:", name: UIKeyboardWillChangeFrameNotification, object: nil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func keyboardWillShow(nofitication: NSNotification) {

    }
    func keyboardWillHide(notification: NSNotification) {
        
    }
    func keyboardWillChangeFrame(notification: NSNotification) {
        
    }
}