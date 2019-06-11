//
//  Alert.swift
//  CryptoView
//
//  Created by Ilgiz Fazlyev on 09/06/2019.
//  Copyright © 2019 Ilgiz Fazlyev. All rights reserved.
//

import Foundation
import Alertift

enum messageType: String {
    case Error
}
class Alert {
    
    static func message(description: String, type: messageType) {
        Alertift.alert(
                title: type.rawValue,
                message: description)
                .action(.cancel("OK"))
                .show()
    }
    
    static func settings(completion: @escaping () -> Void){
        
        
        Alertift.alert(
            title: "Settings",
            message: "")
            .actions(["Show favorite","Show all", "Enable autoupdate", "Disable autoupdate"])
            .action(.cancel("CANCEL"))
            .finally {_,index,_ in
                switch index {
                case 0:
                    UserSettings.setFavoriteListStatus(status: true)
                    completion()
                case 1:
                    UserSettings.setFavoriteListStatus(status: false)
                    completion()
                case 2:
                    UserSettings.setAutoRefreshStatus(status: true)
                    completion()
                case 3:
                    UserSettings.setAutoRefreshStatus(status: false)
                    completion()
                default:
                    completion()
                    break
                }
            }
            .show()
    }
}
