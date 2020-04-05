//
//  NotificationService.swift
//  Twitter_tutorial
//
//  Created by 梶村律太 on 2020/04/05.
//  Copyright © 2020 梶村律太. All rights reserved.
//

import UIKit
import Firebase

struct NotificationService {
    static let shared = NotificationService()
    
    func uploadNotifications(type:NotificationType, tweet: Tweet? = nil, user: User? = nil){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        var values: [String: Any] = ["timestamp": Int(NSDate().timeIntervalSince1970),
                                     "uid":uid, "type":type.rawValue]
        
        if let tweet = tweet {
            values["tweetID"] = tweet.tweetId
            REF_NOTIFICATIONS.child(tweet.user.uid).childByAutoId().updateChildValues(values)
        } else if let user = user {
            REF_NOTIFICATIONS.child(user.uid).childByAutoId().updateChildValues(values)
        }
    }
}
