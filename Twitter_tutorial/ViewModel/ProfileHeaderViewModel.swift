//
//  ProfileHeaderViewModel.swift
//  Twitter_tutorial
//
//  Created by 梶村律太 on 2020/03/30.
//  Copyright © 2020 梶村律太. All rights reserved.
//

import UIKit


enum ProfileFiterOptions: Int,CaseIterable {
    case tweets
    case replies
    case likes
    
    var description: String{
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Tweet & Replies"
        case .likes: return "Likes"
        }
    }
}
struct ProfileHeaderViewModel {
    fileprivate let user: User
    
    let usernameText: String
    
    var followerString: NSAttributedString?{
        return attiributedText(withValue: user.stats?.followers ?? 0, text: "followers")
    }
    var followingString: NSAttributedString?{
        return attiributedText(withValue: user.stats?.following ?? 0, text: "following")
    }
    var actionButtonTitle: String {
        if user.isCurrentUser{
            return "Edit Profile"
        }
        if !user.isFollowed && !user.isCurrentUser {
            return "Follow"
        }
        if user.isFollowed {
            return "Following"
        }
        return "Loading"
    }
    
    init(user: User) {
        self.user = user
        self.usernameText = "@" + user.username
    }
    func attiributedText(withValue value:Int , text: String) -> NSAttributedString{
        let attributedTitle = NSMutableAttributedString(string: "\(value)", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        attributedTitle.append(NSAttributedString(string: " \(text)", attributes: [.font: UIFont.systemFont(ofSize: 14),NSAttributedString.Key.foregroundColor: UIColor.lightGray]))
        return attributedTitle
    }
}
