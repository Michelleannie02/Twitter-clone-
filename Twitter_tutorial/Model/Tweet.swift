//
//  Tweet.swift
//  Twitter_tutorial
//
//  Created by 梶村律太 on 2020/03/29.
//  Copyright © 2020 梶村律太. All rights reserved.
//

import Foundation

struct Tweet {
    let caption: String
    let tweetId: String
    let uid: String
    let likes: Int
    var timestamp:Date!
    let retweetCount: Int
    var user:User
    
    init(user:User,tweetId:String,dictionary:[String:Any]){
        self.tweetId = tweetId
        self.user = user
        
        self.caption = dictionary["caption"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        self.likes = dictionary["likes"] as? Int ?? 0
        self.retweetCount = dictionary["retweetCount"] as? Int ?? 0
        
        if let timestamp = dictionary["timestamp"] as? Double{
            self.timestamp = Date(timeIntervalSince1970: timestamp)
        }
    }
}
