//
//  SplashViewController.swift
//  NearBy
//
//  Created by prog_zidane on 10/28/19.
//  Copyright © 2019 prog_zidane. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    
    @IBOutlet weak var splachActivityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Mark:- Run Activity And Navigate to next ViewController
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.splachActivityIndicator.stopAnimating()
            self.splachActivityIndicator.isHidden = true
            self.showHomeScreen()
        }
    }
}
extension SplashViewController {
    func showHomeScreen(){
        guard let authVC = Constants.mainStoryBoard.instantiateViewController(withIdentifier: "home") as? UINavigationController else {return}
        present(authVC, animated: true ,completion: nil)
    }
}
