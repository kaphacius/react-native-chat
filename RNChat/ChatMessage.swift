//
//  ChatMessage.swift
//  RNChat
//
//  Created by Yurii Zadoianchuk on 03/05/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

import Foundation

struct ChatMessage {
    static let kIsAuthorKey = "isAuthor"
    static let kDateKey = "date"
    static let kMessageKey = "message"
    
    var isAuthor: Bool
    var date: NSDate
    var message: String
    
    init(dictionary: NSDictionary) {
        isAuthor = (dictionary[ChatMessage.kIsAuthorKey] as? NSNumber)?.boolValue ?? false
        date = dictionary[ChatMessage.kDateKey] as? NSDate ?? NSDate()
        message = dictionary[ChatMessage.kMessageKey] as? String ?? ""
    }
    init(isAuthor: Bool, date: NSDate, message: String) {
        self.isAuthor = isAuthor
        self.date = date
        self.message = message
    }
    func toDictionary() -> NSDictionary {
        return [ChatMessage.kIsAuthorKey: NSNumber(bool: isAuthor),
            ChatMessage.kDateKey: date,
            ChatMessage.kMessageKey: message]
    }
}
