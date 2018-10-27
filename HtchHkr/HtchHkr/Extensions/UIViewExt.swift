//
//  UIViewExt.swift
//  HtchHkr
//
//  Created by Zach Cervi on 10/27/18.
//  Copyright © 2018 Zach Cervi. All rights reserved.
//

import UIKit

extension UIView {
    func fadeTo(alphaValue: CGFloat, withDuration duration: TimeInterval){
        UIView.animate(withDuration: duration) {
            self.alpha = alphaValue
        }
    }
}
