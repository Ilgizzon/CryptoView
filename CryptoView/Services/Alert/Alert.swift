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
        Network.getCryptoList{ error in
            Alertift.alert(
                title: type.rawValue,
                message: description)
                .action(.cancel("OK"))
                .show()
        }
    }
}
