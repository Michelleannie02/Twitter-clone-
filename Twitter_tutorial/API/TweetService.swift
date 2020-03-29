//
//  TweetService.swift
//  Twitter_tutorial
//
//  Created by 梶村律太 on 2020/03/29.
//  Copyright © 2020 梶村律太. All rights reserved.
//

import Firebase

struct TweetService {
    static let shared = TweetService()
    
    func uploadTweet(caption:String, completion: @escaping(Error?,DatabaseReference) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let values = ["uid": uid,
                      "timestamp":Int(NSDate().timeIntervalSince1970),
                      "likes":0,
                      "retweets":0,
                      "caption":caption] as [String:Any]
        REF_TWEETS.childByAutoId().updateChildValues(values, withCompletionBlock: completion)
    }
    func fetchTweets(completion:@escaping([Tweet]) -> Void){
        var tweets = [Tweet]()
        
        REF_TWEETS.observe(.childAdded) { snapshot in
            guard let dictionary = snapshot.value as? [String:Any] else { return }
            
            let tweetId = snapshot.key
            let tweet = Tweet(tweetId: tweetId, dictionary: dictionary)
            tweets.append(tweet)
            completion(tweets)
        }
    }
}
