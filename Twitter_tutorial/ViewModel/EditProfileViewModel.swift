//
//  EditProfileViewModel.swift
//  Twitter_tutorial
//
//  Created by 梶村律太 on 2020/04/07.
//  Copyright © 2020 梶村律太. All rights reserved.
//

import UIKit

enum EditProfileOptions: Int, CaseIterable {
    case fullname
    case username
    case bio
    
    var description: String {
        switch self {
        case .fullname:
            return "Username"
        case .username:
            return "Name"
        case .bio:
            return "Bio"
        }
    }
}
