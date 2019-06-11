//
//  RealmCrypto.swift
//  CryptoView
//
//  Created by Ilgiz Fazlyev on 09/06/2019.
//  Copyright © 2019 Ilgiz Fazlyev. All rights reserved.
//

import Foundation
import RealmSwift
class RealmCrypto: Object {
    
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var symbol = ""
    @objc dynamic var rank = ""
    @objc dynamic var price_usd = ""
    @objc dynamic var price_btc = ""
    @objc dynamic var volume_usd_24h = ""
    @objc dynamic var market_cap_usd = ""
    @objc dynamic var available_supply = ""
    @objc dynamic var total_supply = ""
    @objc dynamic var max_supply = ""
    @objc dynamic var percent_change_1h = ""
    @objc dynamic var percent_change_24h = ""
    @objc dynamic var percent_change_7d = ""
    @objc dynamic var last_updated = ""
    @objc dynamic var favorite = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
    

    convenience init(from: LocalCrypto) {
        self.init()
        self.id = from.id ?? ""
        self.name = from.name ?? ""
        self.symbol = from.symbol ?? ""
        self.rank = from.rank ?? ""
        self.price_usd = from.price_usd ?? ""
        self.price_btc = from.price_btc ?? ""
        self.volume_usd_24h = from.volume_usd_24h ?? ""
        self.market_cap_usd = from.market_cap_usd ?? ""
        self.available_supply = from.available_supply ?? ""
        self.total_supply = from.total_supply ?? ""
        self.max_supply = from.max_supply ?? ""
        self.percent_change_1h = from.percent_change_1h ?? ""
        self.percent_change_24h = from.percent_change_24h ?? ""
        self.percent_change_7d = from.percent_change_7d ?? ""
        self.last_updated = from.last_updated  ?? ""
        self.favorite = from.favorite
    }
    
    func convert() -> LocalCrypto {
        return LocalCrypto(
            id: id,
            name: name,
            symbol: symbol,
            rank: rank,
            price_usd: price_usd,
            price_btc: price_btc,
            volume_usd_24h: volume_usd_24h,
            market_cap_usd: market_cap_usd,
            available_supply: available_supply,
            total_supply: total_supply,
            max_supply: max_supply,
            percent_change_1h: percent_change_1h,
            percent_change_24h: percent_change_24h,
            percent_change_7d: percent_change_7d,
            last_updated: last_updated,
            favorite: favorite
        )
    }
    
}
