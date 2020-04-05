//
//  TweetViewModel.swift
//  Twitter_tutorial
//
//  Created by 梶村律太 on 2020/03/30.
//  Copyright © 2020 梶村律太. All rights reserved.
//

import UIKit

struct TweetViewModel {
    
    // MARK: - Properties
    
    let tweet:Tweet
    let user:User
    
    var profileImageUrl: URL? {
        return tweet.user.profileImageUrl
    }
    var timestamp:String{
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second,.minute,.hour,.day,.weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        let now = Date()
        return formatter.string(from: tweet.timestamp, to: now) ?? "2m"
    }
    var usernameText:String{
        return "@\(user.username)"
    }
    var headerTimestamp: String{
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a ・ MM/dd/yyyy"
        return formatter.string(from: tweet.timestamp)
    }
    var retweetAttributedString: NSAttributedString? {
        return attributedText(withValue: tweet.retweetCount, text: "Retweets")
    }
    var likesAttributedString: NSAttributedString?{
        return attributedText(withValue: tweet.likes, text: "Likes")
    }
    var userInfoText: NSAttributedString{
        let title = NSMutableAttributedString(string: user.fullname, attributes: [.font:UIFont.boldSystemFont(ofSize: 14)])
        title.append(NSAttributedString(string: " @\(user.username)",
            attributes: [.font:UIFont.boldSystemFont(ofSize: 14),
                         .foregroundColor:UIColor.lightGray]))
        title.append(NSAttributedString(string: " ・ \(timestamp)",
        attributes: [.font:UIFont.boldSystemFont(ofSize: 14),
                     .foregroundColor:UIColor.lightGray]))
        return title
        
    }
    var likeButtonTintColor: UIColor {
        return tweet.didLike ? .red : .lightGray
    }
    
    var likeButtonImage: UIImage {
        let imageName = tweet.didLike ? "like_filled" : "like"
        return UIImage(named: imageName)!
    }
    var shouldHideReplyLabel: Bool {
        return !tweet.isReply
    }
    var replyText: String? {
        guard let replyingToUsername = tweet.replyingTo else { return nil}
        return "→ replying to @\(replyingToUsername)"
    }
    
    init(tweet:Tweet) {
        self.tweet = tweet
        self.user = tweet.user
    }
    fileprivate func attributedText(withValue value: Int, text: String) -> NSAttributedString {
        let attributedTitile = NSMutableAttributedString(string: "\(value)",attributes: [.font:UIFont.boldSystemFont(ofSize: 14)])
        attributedTitile.append(NSAttributedString(string: "\(text)", attributes: [.font:UIFont.systemFont(ofSize: 14),.foregroundColor:UIColor.lightGray]))
        return attributedTitile
    }
    // MARK: - Helpers
    func size(forWidth width: CGFloat) -> CGSize {
        let mesurementLabel = UILabel()
        mesurementLabel.text = tweet.caption
        mesurementLabel.numberOfLines = 0
        mesurementLabel.lineBreakMode = .byWordWrapping
        mesurementLabel.translatesAutoresizingMaskIntoConstraints = false
        mesurementLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
        return mesurementLabel.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
}
