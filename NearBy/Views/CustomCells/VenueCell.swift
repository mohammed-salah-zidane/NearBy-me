//
//  VenueCell.swift
//  NearBy
//
//  Created by prog_zidane on 10/28/19.
//  Copyright © 2019 prog_zidane. All rights reserved.
//

import UIKit

class VenueCell: UITableViewCell {
    
    @IBOutlet weak var venueDetailedLocationLabel: UILabel!
    @IBOutlet weak var venueImageView: UIImageView!
    @IBOutlet weak var venueTitleLabel: UILabel!
    
    var venue:Venue? {
        didSet{
            venueTitleLabel.text = venue?.name
            venueDetailedLocationLabel.text = venue?.location?.formattedAddress!.first
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
extension VenueCell{
    
    //Mark:- load image from server and update it
    func loadImage(_ completion:@escaping(_ code :Int?)->()){
        DispatchQueue.main.async {            VenuesServices.sharedInstance.loadVenueImage(String((self.venue?.id)!)) { (status, image,code) in
                if status {
                    self.venueImageView.nuke(url: image!)
                    self.venueImageView.shadow = true
                    self.venueImageView.circleCorner = true
                    self.venueImageView.clipsToBounds = true
                    completion(code!)
                    return
                }
                if code == 429 {
                    completion(code!)
                    return
                }
            }
        }
    }
}
