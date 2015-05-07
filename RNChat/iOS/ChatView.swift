//
//  ChatView.swift
//  TestProject
//
//  Created by Yurii Zadoianchuk on 02/05/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

import UIKit

class ChatView: RCTView, UITextViewDelegate {
    var chatCollectionView: UICollectionView!
    var inputToolbar: UIToolbar!
    var inputTextView: UITextView!
    var sendButton: UIButton!
    var inputToolBarBottomConstraint: NSLayoutConstraint!
    var chatDataSource: ChatDataSource!
    
    let kToolbarHeight: CGFloat = 44.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        var layout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        
        chatCollectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        chatCollectionView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.addSubview(chatCollectionView)
        inputToolbar = UIToolbar(frame: CGRectZero)
        inputToolbar.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.addSubview(inputToolbar)
        inputTextView = UITextView(frame: CGRectZero)
        inputTextView.setTranslatesAutoresizingMaskIntoConstraints(false)
        inputTextView.delegate = self
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
        inputToolBarBottomConstraint = NSLayoutConstraint(item: inputToolbar, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0)
        self.addConstraints([inputToolbarLeading, inputToolbarTrailing, inputToolBarBottomConstraint])
        inputToolbar.addConstraint(inputToolbarHeight)
        
        var collectionViewTop = NSLayoutConstraint(item: chatCollectionView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0);
        var collectionViewBottom = NSLayoutConstraint(item: chatCollectionView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: inputToolbar, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0)
        var collectionViewLeading = NSLayoutConstraint(item: chatCollectionView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0)
        var collectionViewTrailing = NSLayoutConstraint(item: chatCollectionView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.RightMargin, multiplier: 1.0, constant: 0.0)
        self.addConstraints([collectionViewTop, collectionViewBottom, collectionViewLeading, collectionViewTrailing])
        
        var sendButtonTop = NSLayoutConstraint(item: sendButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: inputToolbar, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0)
        var sendButtonBottom = NSLayoutConstraint(item: sendButton, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: inputToolbar, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0)
        var sendButtonTrailing = NSLayoutConstraint(item: sendButton, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: inputToolbar, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0)
        var sendButtonWidth = NSLayoutConstraint(item: sendButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: sendButton.frame.width)
        inputToolbar.addConstraints([sendButtonTop, sendButtonBottom, sendButtonTrailing])
        sendButton.addConstraint(sendButtonWidth)
        
        var inputTextViewTop = NSLayoutConstraint(item: inputTextView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: inputToolbar, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0)
        var inputTextViewBottom = NSLayoutConstraint(item: inputTextView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: inputToolbar, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0)
        var inputTextViewLeading = NSLayoutConstraint(item: inputTextView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: inputToolbar, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0)
        var inputTextViewTrailing = NSLayoutConstraint(item: inputTextView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: sendButton, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0)
        inputToolbar.addConstraints([inputTextViewTop, inputTextViewBottom, inputTextViewLeading, inputTextViewTrailing])
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillChangeFrame:", name: UIKeyboardWillChangeFrameNotification, object: nil)
        
        sendButton.addTarget(self, action: "sendButtonTapped", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.chatDataSource = ChatDataSource(сollectionView: self.chatCollectionView)
        self.chatCollectionView.backgroundColor = UIColor.cyanColor()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func keyboardWillChangeFrame(notification: NSNotification) {
        if let ui = notification.userInfo,
            let frameBeginValue = (ui[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue(),
            let frameEndValue = (ui[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.CGRectValue(),
            let duration = (ui[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue,
            let curveInt = (ui[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber)?.intValue,
            let curve = UIViewAnimationCurve(rawValue: Int(curveInt)) {
                self .animateInputToolbarWithYPosDiff(frameBeginValue.origin.y - frameEndValue.origin.y, duration: duration, animationCurve: curve)
        }
    }
    
    func sendButtonTapped() {
        if true == inputTextView.isFirstResponder() {
            inputTextView.resignFirstResponder()
            var message = ChatMessage(isAuthor: true, date: NSDate(), message: inputTextView.text)
            chatDataSource.addMessage(message)
        }
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func animateInputToolbarWithYPosDiff(yPosDiff: CGFloat, duration: Double, animationCurve: UIViewAnimationCurve) {
        var option = UInt(animationCurve.rawValue << 16)
        UIView.animateWithDuration(duration, delay: 0.0, options: UIViewAnimationOptions(option), animations: { () -> Void in
            self.inputToolBarBottomConstraint.constant -= yPosDiff
            self.layoutIfNeeded()
            }, completion: nil)
    }
}
