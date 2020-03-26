//
//  FeedController.swift
//  Twitter_tutorial
//
//  Created by 梶村律太 on 2020/03/26.
//  Copyright © 2020 梶村律太. All rights reserved.
//

import UIKit

class FeedController: UIViewController {
       
        // MARK: - Properties
       
       //MARK: - Lifecycle
    
       override func viewDidLoad() {
           super.viewDidLoad()
        configureUI()

       }
       
       // MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
    
}
