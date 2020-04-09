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
    
    
    
    func uploadNotifications(toUser user: User,
                             type:NotificationType,
                             tweetID: String? = nil) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        var values: [String: Any] = ["timestamp": Int(NSDate().timeIntervalSince1970),
                                     "uid":uid, "type":type.rawValue]
        
        if let tweetID = tweetID {
            values["tweetID"] = tweetID
        }
        REF_NOTIFICATIONS.child(user.uid).childByAutoId().updateChildValues(values)
    }
    func fetchNotification(completion: @escaping([Notification]) -> Void){
        var notifications = [Notification]()
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        REF_NOTIFICATIONS.child(uid).observe(.childAdded) { snapshot in
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            guard let uid = dictionary["uid"] as? String else { return }
            
            UserService.shared.fetchUser(uid: uid) { user in
                let notification = Notification(user: user, dictionary: dictionary)
                notifications.append(notification)
                completion(notifications)
            }
        }
    }
    
    
}
