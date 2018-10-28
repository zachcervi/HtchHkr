//
//  RoundedCornerTextField.swift
//  HtchHkr
//
//  Created by Zach Cervi on 10/27/18.
//  Copyright © 2018 Zach Cervi. All rights reserved.
//

import UIKit

class RoundedCornerTextField: UITextField {
    var textReactOffSet: CGFloat = 20
    override func awakeFromNib() {
        setupView()
    }

    func setupView() {
        self.layer.cornerRadius = self.frame.height / 2
        
    }
//    override func textRect(forBounds bounds: CGRect) -> CGRect {
//        return CGRect(x: 0 + textReactOffSet, y: 0 + (textReactOffSet / 2), width: self.frame.width - textReactOffSet, height: self.frame.height + textReactOffSet)
//    }
//    override func editingRect(forBounds bounds: CGRect) -> CGRect {
//          return CGRect(x: 0 + textReactOffSet, y: 0 + (textReactOffSet / 2), width: self.frame.width - textReactOffSet, height: self.frame.height + textReactOffSet)
//    }

}
