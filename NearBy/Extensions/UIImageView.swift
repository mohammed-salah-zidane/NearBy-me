//
//  UIImageView.swift
//  Read On
//
//  Created by prog_zidane on 10/19/19.
//  Copyright © 2019 prog_zidane. All rights reserved.
//

import Foundation
import UIKit
import Nuke

extension UIImageView{
    
    convenience init(assetName : String, scale : UIView.ContentMode = .scaleAspectFit){
        self.init(image : UIImage(named: assetName))
        contentMode = scale
    }
    func nuke(url : String?,placeHolder : String = "PlaceHolder"){
        let options = ImageLoadingOptions(
            placeholder: UIImage(named: placeHolder),
            transition: .fadeIn(duration: 0.5),
            contentModes: .init(
                success: .scaleAspectFill,
                failure: .scaleAspectFill,
                placeholder: .scaleAspectFill
            )
        )
        
        if let URL = URL(string: url!) {
            Nuke.loadImage(with: ImageRequest(url: URL), options: options, into: self, progress: nil) { (result) in
                switch result{
                case .success(_):break
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    
}
