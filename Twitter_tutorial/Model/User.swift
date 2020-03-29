//
//  User.swift
//  Twitter_tutorial
//
//  Created by 梶村律太 on 2020/03/27.
//  Copyright © 2020 梶村律太. All rights reserved.
//

import Foundation

struct User{
    let fullname:String
    let email:String
    let username:String
    var profileImageUrl:URL?
    let uid:String
    
    init(uid: String, dictionary: [String: AnyObject]) {
        self.uid = uid
        
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        if let profileImageUrlString = dictionary["profileImageUrl"] as? String{
            guard let url = URL(string: profileImageUrlString) else { return  }
            self.profileImageUrl = URL(string: profileImageUrlString)
        }
    }
}
