//
//  CircleView.swift
//  HtchHkr
//
//  Created by Zach Cervi on 10/19/18.
//  Copyright © 2018 Zach Cervi. All rights reserved.
//

import UIKit

class CircleView: UIView {

    @IBInspectable var borderColor: UIColor?{
        didSet{
            setupView()
        }
    }
    override func awakeFromNib() {
        setupView()
    }
    func setupView(){
     self.layer.cornerRadius = self.frame.width / 2
        self.layer.borderWidth = 1.5
        self.layer.borderColor = borderColor?.cgColor
    }
}
