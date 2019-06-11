//
//  SecondViewControllerUI.swift
//  CryptoView
//
//  Created by Ilgiz Fazlyev on 11/06/2019.
//  Copyright © 2019 Ilgiz Fazlyev. All rights reserved.
//

import Foundation
import UIKit
extension SecondViewController{
    
    func configureUI() {
        priceUsdLabel.text = cryptoData.price_usd
        priceBtcLabel.text = cryptoData.price_btc
        volumeUsd24hLabel.text = cryptoData.volume_usd_24h
        marketCapUsdLabel.text = cryptoData.market_cap_usd
        availableSupplyLabel.text = cryptoData.available_supply
        totalSupplyLabel.text = cryptoData.total_supply
        maxSupplyLabel.text = cryptoData.max_supply
        percentChange1hLabel.text = cryptoData.percent_change_1h
        percentChange24hLabel.text = cryptoData.percent_change_24h
        percentChange7dLabel.text = cryptoData.percent_change_7d
        lastUpdatedLabel.text = Double(cryptoData.last_updated ?? "")!.dateFormatted(withFormat : Constants.DATE_FORMAT)
        configureNavBar()
    }
    
    func configureNavBar(){
        let favorite = UIBarButtonItem(
            barButtonSystemItem: cryptoData.favorite == true ?
                UIBarButtonItem.SystemItem.trash : UIBarButtonItem.SystemItem.bookmarks,
            target: nil,
            action: nil
        )
        self.navigationItem.title = cryptoData.name ?? ""
        self.navigationItem.rightBarButtonItem = favorite
    }
}
