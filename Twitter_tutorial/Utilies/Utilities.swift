//
//  Utilities.swift
//  Twitter_tutorial
//
//  Created by 梶村律太 on 2020/03/26.
//  Copyright © 2020 梶村律太. All rights reserved.
//

import UIKit

class Utilities {
    func inputContainerView(withImage image:UIImage ,textField:UITextField)->UIView{
        let view = UIView()
        let iv = UIImageView()
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        iv.image = image
        view.addSubview(iv)
        iv.anchor(left:view.leftAnchor,bottom: view.bottomAnchor,paddingLeft: 8,paddingBottom: 8)
        iv.setDimensions(width: 24, height: 24)
        
        view.addSubview(textField)
        textField.anchor(left:iv.rightAnchor,bottom: view.bottomAnchor, right: view.rightAnchor,paddingLeft: 8, paddingBottom: 8)
        
        let dividerView = UIView()
        dividerView.backgroundColor = .white
        view.addSubview(dividerView)
        dividerView.anchor(left:view.leftAnchor,bottom: view.bottomAnchor, right: view.rightAnchor,paddingLeft: 8,height:0.7)
        
        return view
    }
    func textField(withPlaceholder placeholder:String) -> UITextField {
        let tf = UITextField()
        tf.placeholder = placeholder
        tf.textColor = .white
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.attributedPlaceholder = NSAttributedString(string: placeholder,attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        return tf
    }
    
    func attributedButton(_ firstPart:String, _ secondPart: String) -> UIButton {
        let button = UIButton(type: .system)
        
        var attributedTitle = NSMutableAttributedString(string: firstPart, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 16),NSAttributedString.Key.foregroundColor:UIColor.white])
        
        attributedTitle.append(NSMutableAttributedString(string: secondPart, attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 16),NSAttributedString.Key.foregroundColor:UIColor.white])) 
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        return button
    }
}
