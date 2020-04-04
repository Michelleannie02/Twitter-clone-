//
//  ActionSheetLauncher.swift
//  Twitter_tutorial
//
//  Created by 梶村律太 on 2020/04/04.
//  Copyright © 2020 梶村律太. All rights reserved.
//

import UIKit

class ActionSheetLancher: NSObject {
    // MARK: - Properties
    
    private let user: User
    init(user: User) {
        self.user = user
        super.init()
    }
    // MARK: - Helpers
    
    func show(){
        print("DEBUG:show at\(user.username)")
    }
}
