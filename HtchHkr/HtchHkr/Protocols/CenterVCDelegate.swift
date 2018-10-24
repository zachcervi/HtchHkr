//
//  CenterVCDelegate.swift
//  HtchHkr
//
//  Created by Zach Cervi on 10/23/18.
//  Copyright © 2018 Zach Cervi. All rights reserved.
//

import UIKit

protocol CenterVCDelegate {
    func toggleLeftPanel()
    func addLeftPanelViewController()
    func animateLeftPanel(shouldExpand: Bool)
}
