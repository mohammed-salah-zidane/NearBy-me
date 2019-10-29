//
//  Common.swift
//  NearBy
//
//  Created by prog_zidane on 10/28/19.
//  Copyright © 2019 prog_zidane. All rights reserved.
//

import Foundation
import UIKit


class Constants{
    static let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
    static let fourSquareClientID = "FVVQTJG2OULQGYMAQBTCSPSWBPG1RRDCJ5YIXGN41RUS00QW"
    static let fourSquarClientSceret = "IHX5IWANVZCSF4IBXLGTDNOKDDWSCTATJUGWKSESKB0XPFNK"
    static let BASE_URL = "https://api.foursquare.com/v2/venues/"
    static let userDefaults = UserDefaults.standard
}

func refactorURL(_ paramters:[String],endPoint:EndPoints)->String{
    var url : String
    switch endPoint {
    case .explore:
        url = Constants.BASE_URL + EndPoints.explore.rawValue
    case .photos:
        url = Constants.BASE_URL + paramters[0]   + "/\(EndPoints.photos)/"
        
    }
    return url
}

enum UpdateStatus :String{
    case realTime = "Realtime"
    case singleUpdate = "Single"
}

enum EndPoints:String{
    case explore
    case photos
}
