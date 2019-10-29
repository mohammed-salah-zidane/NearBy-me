//
//  UserDefaults+ Extension.swift
//  NearBy
//
//  Created by prog_zidane on 10/29/19.
//  Copyright © 2019 prog_zidane. All rights reserved.
//

import Foundation
extension UserDefaults {
    func setStatus (_ status:UpdateStatus) {
        self.set(status.rawValue, forKey: KEYS.status.rawValue)
        self.synchronize()
    }
    func reloadStatus() -> String? {
        return Constants.userDefaults.string(forKey:KEYS.status.rawValue ) ?? nil
    }
}
enum KEYS :String {
    case status
}
