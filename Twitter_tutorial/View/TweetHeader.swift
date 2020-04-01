//
//  TweetHeader.swift
//  Twitter_tutorial
//
//  Created by 梶村律太 on 2020/04/01.
//  Copyright © 2020 梶村律太. All rights reserved.
//

import UIKit

class TweetHeader: UICollectionReusableView{
    // MARK: Properties
    
    // MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
