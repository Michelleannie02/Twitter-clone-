//
//  EditProfileFooter.swift
//  Twitter_tutorial
//
//  Created by 梶村律太 on 2020/04/09.
//  Copyright © 2020 梶村律太. All rights reserved.
//

import UIKit

protocol EditProfileFooterDelegate: class {
    func handleLogout()
}

class EditProfileFooter: UIView {
    // MARK: - Properties
    weak var delegate: EditProfileFooterDelegate?
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handlelogout), for: .touchUpInside)
        button.backgroundColor = .red
        button.layer.cornerRadius = 5
        return button
    }()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(logoutButton)
        logoutButton.anchor(left: leftAnchor, right: rightAnchor, paddingLeft: 16, paddingRight: 16)
        logoutButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logoutButton.centerY(inView: self)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Selectors
    
    @objc func handlelogout() {
        delegate?.handleLogout()
    }
}

