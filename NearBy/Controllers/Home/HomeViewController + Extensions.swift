//
//  HomeViewController + Extensions.swift
//  NearBy
//
//  Created by prog_zidane on 10/28/19.
//  Copyright © 2019 prog_zidane. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import Toast_Swift

extension HomeViewController {
    
    func initTableView(){
        //tabe view data source and deleget
        venuesTableView.delegate = self
        venuesTableView.dataSource = self
        //register cell
        venuesTableView.registerCellNib(cellClass: VenueCell.self)
        
        //remove empty cells
        venuesTableView.tableFooterView = UIView()
        
        //autmatic sizeing
        venuesTableView.estimatedRowHeight = UITableView.automaticDimension
        venuesTableView.estimatedRowHeight = 100
    }
    
    //Mark:- initiate location services
    func initLocationServices(){
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            
            //for update nearby places when location change eveery 500m
            locationManager.distanceFilter = 500
            locationManager.activityType = .automotiveNavigation
            //authrization request
            locationManager.requestAlwaysAuthorization()
            locationManager.startMonitoringSignificantLocationChanges()
            locationManager.startUpdatingLocation()
        }
    }
    //Mark:- for detect current mode and update variable and view
    func detectCurrentStatusMode(){
        if Constants.userDefaults.reloadStatus() != nil {
            if Constants.userDefaults.reloadStatus()! == "Realtime" {
                statusMode = UpdateStatus.realTime
            }else {
                statusMode = UpdateStatus.singleUpdate
            }
            didChooseCurrentMode = true
            requestData()
            print(statusMode.rawValue)
        }else {
            switchStatus(message: "Please select update mode")
        }
        changetitle()
    }
    //Mark:- switch update mode (Realtime or Single)
    func switchStatus(message:String?){
        AlertManager.showAlert(message ?? "Switch update mode or cancel and use the default", inViewController: self) { (updateStatus) in
            switch updateStatus{
            case .realTime? :
                //perform update for realTime mode
                self.statusMode = .realTime
                Constants.userDefaults.setStatus(.realTime)
                self.changetitle()
                
            case .singleUpdate? :
                //perform update for single mode
                self.statusMode = .singleUpdate
                Constants.userDefaults.setStatus(.singleUpdate)
                self.changetitle()
            case .none:
                break
            }
            self.didChooseCurrentMode = true
            if self.venues == nil {
                self.requestData()
            }
            
        }
    }
    
    //Mark:- change button title
    func changetitle() {
        let item = self.navigationItem.rightBarButtonItem!
        item.title = statusMode.rawValue
    }
    
    //Mark:- make explore requests
    func explore(_ lat:String,_ long : String){        
        if !isFirstRequest {
            //show loader for fitst time
            self.showLoadingIndicator()
            isFirstRequest = true
        }
        VenuesServices.sharedInstance.explore(lat, long) { (status, venuesItems) in
            self.hideLoadingIndicator()
            if status {
                self.venues = venuesItems
            }else {
                print( status)
                self.venuesTableView.reloadData()
                self.errorImageView.isHidden = false
                self.errorImageView.image = #imageLiteral(resourceName: "somethingWentWrong")
                
            }
        }
    }
    func requestData (){
        guard let userLocation = currentLocation else {
            return
        }
        switch statusMode {
        case .realTime:
            print(userLocation.coordinate.latitude)
            explore(String(userLocation.coordinate.latitude), String(userLocation.coordinate.longitude))
        case .singleUpdate:
            if !singleUpdateDone{
                print(userLocation.coordinate.latitude)
                explore(String(userLocation.coordinate.latitude), String(userLocation.coordinate.longitude))
                singleUpdateDone = true
            }
        }
    }
}

//Mark:- confirming table view delegates
extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venues?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let venueCell = venuesTableView.dequeue() as VenueCell
        guard let venue = venues?[indexPath.row].venue else {
            return VenueCell()
        }
        venueCell.venue = venue
        venueCell.loadImage { (code) in
            if code == 429{
                //because off quots exceeded for free account
                self.view.makeToast("App quota exceeded can't load  Venues photos please update your quota")
            }
        }
        return venueCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        
    }
}


// MARK - CLLocationManagerDelegate
extension HomeViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let userLocation = locations.last else {return }
        currentLocation = userLocation
        if didChooseCurrentMode{
            requestData()
        }
        
    }
}
