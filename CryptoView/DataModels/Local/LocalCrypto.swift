//
//  LocalCrypto.swift
//  CryptoView
//
//  Created by Ilgiz Fazlyev on 09/06/2019.
//  Copyright © 2019 Ilgiz Fazlyev. All rights reserved.
//

import Foundation

class LocalCrypto: Codable {
    
    var id = ""
    var name = ""
    var symbol = ""
    var rank = ""
    var price_usd = ""
    var price_btc = ""
    var volume_usd_24h = ""
    var market_cap_usd = ""
    var available_supply = ""
    var total_supply = ""
    var max_supply = ""
    var percent_change_1h = ""
    var percent_change_24h = ""
    var percent_change_7d = ""
    var last_updated = ""
    var favorite = false
    
    enum CodingKeys: String, CodingKey {
        case
        id,
        name,
        symbol,
        rank,
        price_usd,
        price_btc,
        market_cap_usd,
        available_supply,
        total_supply,
        max_supply,
        percent_change_1h,
        percent_change_24h,
        percent_change_7d,
        last_updated
        
        case
        volume_usd_24h = "24h_volume_usd"
        
    }
    
    init(
        id: String,
        name: String,
        symbol: String,
        rank: String,
        price_usd: String,
        price_btc: String,
        volume_usd_24h: String,
        market_cap_usd: String,
        available_supply: String,
        total_supply: String,
        max_supply: String,
        percent_change_1h: String,
        percent_change_24h: String,
        percent_change_7d: String,
        last_updated: String,
        favorite : Bool = false
        ) {
        self.id = id
        self.name = name
        self.symbol = symbol
        self.rank = rank
        self.price_usd = price_usd
        self.price_btc = price_btc
        self.volume_usd_24h = volume_usd_24h
        self.market_cap_usd = market_cap_usd
        self.available_supply = available_supply
        self.total_supply = total_supply
        self.max_supply = max_supply
        self.percent_change_1h = percent_change_1h
        self.percent_change_24h = percent_change_24h
        self.percent_change_7d = percent_change_7d
        self.last_updated = last_updated
        self.favorite = favorite
    }
}
typealias CryptoList = [LocalCrypto]
