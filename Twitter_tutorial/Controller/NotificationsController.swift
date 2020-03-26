//
//  NotificationController.swift
//  Twitter_tutorial
//
//  Created by 梶村律太 on 2020/03/26.
//  Copyright © 2020 梶村律太. All rights reserved.
//

import UIKit

class NotificationsController: UIViewController {
       
        // MARK: - Properties
       
       //MARK: - Lifecycle
    
       override func viewDidLoad() {
           super.viewDidLoad()
        configureUI()

       }
       
       // MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        navigationItem.title = "Notification"
    }
}
