//
//  ExploreVenuesServices.swift
//  NearBy
//
//  Created by prog_zidane on 10/28/19.
//  Copyright © 2019 prog_zidane. All rights reserved.
//

import Foundation
import Alamofire

//Mark:- Venues Service
enum VenuesServices{
    case sharedInstance
    
    
    //Mark:- Get Venue Recommendations
    func explore(_ lat: String? , _ long:String?,completion:@escaping(_ status:Bool, _ venues:[Item]?)->()){
        
        let paramters = ["ll":"\(lat!),\(long!)","limit":20,"radius":1000,"sortByDistance":1,"client_id":Constants.fourSquareClientID,"client_secret":Constants.fourSquarClientSceret,"v" :20191015] as [String : Any]
        
        let url = refactorURL([], endPoint: EndPoints.explore)
        
        Alamofire.request(url, method: .get,parameters:paramters, encoding: URLEncoding.default)
            .responseJSON { (response) in
            print(response)
                switch response.result{
                case  .failure:
                    completion(false,nil)
                case .success:
                    
                    let decoder = JSONDecoder()
                    do {
                        let responseModel = try decoder.decode(ExploreVenuesModel.self, from: response.data!)
                            if responseModel.response != nil && responseModel.meta?.code == 200  {
                                completion(true,responseModel.response?.groups![0].items)
                                return
                            }
                            completion(false,nil)
                            return
                    }catch{
                        print(error.localizedDescription)
                        completion(false,nil)
                    }
                }
                
        }
    }
    
    
    //Mark:- Get a Venue's Photos
    //API has limit quota for retraiving images with (Free App) so, you need to to update app on FourSqaure and update userless authentication(paramters).
    //If Qautas is exceeded a toast will be display for that
    func loadVenueImage(_ id:String,completion:@escaping(_ status:Bool, _ venueImage:String?,_ code:Int?)->()){
        let paramters = [id]
        print(id)
        let url = refactorURL(paramters , endPoint: EndPoints.photos)
        let param = ["VENUE_ID":"XX\(id)XX","limit":1,"client_id":Constants.fourSquareClientID,"client_secret":Constants.fourSquarClientSceret,"v" :20191015] as [String : Any]
        
        Alamofire.request(url, method: .get,parameters:param, encoding: URLEncoding.default)
            .responseJSON { (response) in
            print(response)
                switch response.result{
                case  .failure:
                    completion(false,nil,nil)
                case .success:

                    let decoder = JSONDecoder()
                    do {
                        let responseModel = try decoder.decode(VenuesPhotosModel.self, from: response.data!)
                        
                        if responseModel.response != nil && responseModel.meta?.code == 200 {
                            guard let imageUrl = responseModel.response?.photos?.photoUrl else {return}
                            completion(true,imageUrl,200)
                            return
                        }
                        completion(false ,nil,responseModel.meta?.code)
                        
                    }catch{
                        print(error.localizedDescription)
                        completion(false,nil,nil)
                    }
                }
                
        }
    }
}
