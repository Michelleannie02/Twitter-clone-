//
//  EditProfileCell.swift
//  Twitter_tutorial
//
//  Created by 梶村律太 on 2020/04/07.
//  Copyright © 2020 梶村律太. All rights reserved.
//

import UIKit

class EditProfileCell: UITableViewCell {
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemPurple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
