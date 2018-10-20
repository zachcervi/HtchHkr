//
//  RoundedImageView.swift
//  HtchHkr
//
//  Created by Zach Cervi on 10/19/18.
//  Copyright © 2018 Zach Cervi. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {
    override func awakeFromNib() {
        setupView()
    }
    func setupView(){
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }

}
