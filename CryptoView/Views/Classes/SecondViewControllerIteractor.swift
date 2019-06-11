//
//  SecondViewControllerIteractor.swift
//  CryptoView
//
//  Created by Ilgiz Fazlyev on 11/06/2019.
//  Copyright © 2019 Ilgiz Fazlyev. All rights reserved.
//

import Foundation

extension SecondViewController {
    
    func updateDB() {
        cryptoData.favorite = !cryptoData.favorite
        DB.updateOrAddData(data: cryptoData)
    }
}
