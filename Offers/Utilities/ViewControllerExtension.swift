//
//  ViewControllerExtension.swift
//  Offers
//
//  Created by Abdelrahman Sobhy on 10/6/20.
//  Copyright © 2020 Abdelrahman Sobhy. All rights reserved.
//

import Foundation
import MBProgressHUD

extension UIViewController {
    func loading(_ show: Bool){
        if show {
            MBProgressHUD.showAdded(to: self.view, animated: true)
        } else{
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
}
