//
//  UserSettings.swift
//  CryptoView
//
//  Created by Ilgiz Fazlyev on 10/06/2019.
//  Copyright © 2019 Ilgiz Fazlyev. All rights reserved.
//

import Foundation

class UserSettings {
    
    static func getAutoRefreshStatus() -> Bool {
        return UserDefaults.standard.bool(forKey: Constants.REFRESH_STATUS)
    }
    
    static func setAutoRefreshStatus(status: Bool){
        UserDefaults.standard.set(status, forKey: Constants.REFRESH_STATUS)
    }
    
    static func getFavoriteListStatus() -> Bool {
       return UserDefaults.standard.bool(forKey: Constants.FAVORITE_LIST)
    }
    
    static func setFavoriteListStatus(status: Bool){
        UserDefaults.standard.set(status, forKey: Constants.FAVORITE_LIST)
    }
    
}
