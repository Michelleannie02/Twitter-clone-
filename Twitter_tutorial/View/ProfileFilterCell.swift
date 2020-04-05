//
//  ProfileFilterCell.swift
//  Twitter_tutorial
//
//  Created by 梶村律太 on 2020/03/30.
//  Copyright © 2020 梶村律太. All rights reserved.
//

import UIKit

class ProfileFilterCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var option: ProfileFiterOptions!{
        didSet{titleLabel.text = option.description}
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "test"
        label.textColor = .lightGray
        return label
    }()
    override var isSelected: Bool{
        didSet{
            titleLabel.font = isSelected ? UIFont.boldSystemFont(ofSize: 16):
                UIFont.systemFont(ofSize: 14)
            titleLabel.textColor = isSelected ? .twitterBlue:.lightGray
        }
    }
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(titleLabel)
        titleLabel.center(inView: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
