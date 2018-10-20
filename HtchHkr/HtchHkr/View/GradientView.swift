//
//  GradientView.swift
//  HtchHkr
//
//  Created by Zach Cervi on 10/19/18.
//  Copyright © 2018 Zach Cervi. All rights reserved.
//

import UIKit

class GradientView: UIView {
    let width = UIScreen.main.bounds.width

  let gradient = CAGradientLayer()
    
    override func awakeFromNib() {
        setupGradientView()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = self.bounds
    }
    
    func setupGradientView(){
       // gradient.frame = self.bounds
        
        gradient.colors = [UIColor.white.cgColor, UIColor.init(white: 1.0, alpha: 0.0).cgColor]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint =  CGPoint(x: 0, y: 1.0)
        gradient.locations = [0.8, 1.0]
        self.layer.addSublayer(gradient)
    }
}
