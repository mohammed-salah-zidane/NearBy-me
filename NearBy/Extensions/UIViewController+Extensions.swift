//
//  UIViewController+Extensions.swift
//  NearBy
//
//  Created by prog_zidane on 10/29/19.
//  Copyright © 2019 prog_zidane. All rights reserved.
//

import UIKit
extension UIViewController{
    func showLoadingIndicator() {
        LoadingIndicatorView.show("Update Nearby Places Please Wait...")
    }
    func hideLoadingIndicator() {
        LoadingIndicatorView.hide()
    }
}
