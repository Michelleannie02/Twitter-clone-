//
//  MainTabViewController.swift
//  Twitter_tutorial
//
//  Created by 梶村律太 on 2020/03/26.
//  Copyright © 2020 梶村律太. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {
    
    // MARK: - Properties
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(UIImage(named: "new_tweet"), for: .normal)
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle
 
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureUI()

    }
    // MARK: - Selectors
    
    @objc func actionButtonTapped(){
        print(123)
    }
   
    
    
    // MARK: - Helpers
    func configureUI(){
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
        actionButton.layer.cornerRadius = 56/2
        
    }
    
    
    func configureViewController(){
        let feed = FeedController()
        let nav1 = templeteNavigationController(image: UIImage(named: "home_unselected")!, rootViewController: feed)
        
        let explore = ExploreController()
        let nav2 = templeteNavigationController(image: UIImage(named: "search_unselected")!, rootViewController: explore)
        let notifications = NotificationsController()
        let nav3 = templeteNavigationController(image: UIImage(named: "like_unselected")!, rootViewController: notifications)
        let conversations = ConversationsController()
        let nav4 = templeteNavigationController(image: UIImage(named: "ic_mail_outline_white_2x-1")!, rootViewController: conversations)
        
        viewControllers = [nav1,nav2,nav3,nav4]
        
    }
    func templeteNavigationController(image:UIImage,rootViewController:UIViewController)->UINavigationController{
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        return nav
    }
    
    
    

}
