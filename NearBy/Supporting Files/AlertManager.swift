//
//  AlertManager.swift
//  NearBy
//
//  Created by prog_zidane on 10/29/19.
//  Copyright © 2019 prog_zidane. All rights reserved.
//

import Foundation
import UIKit

typealias AlertCompletionHandler = (UpdateStatus?) -> Void

class AlertManager {
    
    class func showAlert(_ message: String, inViewController: UIViewController, completionHandler: AlertCompletionHandler? = nil) {
        let alert = UIAlertController(title: "",
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Realtime", style: .default, handler: { (alertAction) in
            if let theHandler = completionHandler {
                theHandler(UpdateStatus.realTime)
            }
        }))
        alert.addAction(UIAlertAction(title: "Single Update", style: .default, handler: { (alertAction) in
            if let theHandler = completionHandler {
                theHandler(UpdateStatus.singleUpdate)
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (alertAction) in
            if let theHandler = completionHandler {
                theHandler(nil)
            }
        }))
        
        inViewController.present(alert,
                                 animated: true,
                                 completion: nil)
    }
}

