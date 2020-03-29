//
//  UserService.swift
//  Twitter_tutorial
//
//  Created by 梶村律太 on 2020/03/27.
//  Copyright © 2020 梶村律太. All rights reserved.
//

import Firebase

struct UserService {
    static let shared = UserService()

    func fetchUser(completion: @escaping(User) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            guard let email = dictionary["email"] else { return }
            
            let user = User(uid: uid, dictionary: dictionary)
            completion(user)
        }
    }
}
