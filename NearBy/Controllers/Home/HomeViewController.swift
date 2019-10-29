//
//  ViewController.swift
//  NearBy
//
//  Created by prog_zidane on 10/28/19.
//  Copyright © 2019 prog_zidane. All rights reserved.
//

import UIKit
import CoreLocation
class HomeViewController: UIViewController {
    @IBOutlet weak var venuesTableView: UITableView!
    @IBOutlet weak var errorImageView: UIImageView!
    @IBOutlet weak var statusUpdateButton: UIBarButtonItem!
    
    //Mark:- declare Helper variables
    var locationManager : CLLocationManager!
    var currentLocation : CLLocation!
    var statusMode : UpdateStatus = .realTime
    var singleUpdateDone = false
    var isFirstRequest = false
    var didChooseCurrentMode = false
    var venues : [Item]? {
        didSet {
            venuesTableView.reloadData()
            if self.venues?.count == 0 {
                self.errorImageView.isHidden = false
                self.errorImageView.image = #imageLiteral(resourceName: "no_data_found")
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initLocationServices()
        initTableView()
        detectCurrentStatusMode()
    }
    
    //update mode
    @IBAction func didStatusUpdateButtonPressed(_ sender: Any) {
        switchStatus(message: nil)
    }
    
    
}
