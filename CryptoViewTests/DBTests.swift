//
//  DBTests.swift
//  CryptoViewTests
//
//  Created by Ilgiz Fazlyev on 11/06/2019.
//  Copyright © 2019 Ilgiz Fazlyev. All rights reserved.
//

import XCTest
@testable import CryptoView
class DBTests: XCTestCase {

    
    func testAddData() {

        let crypto = LocalCrypto(id: "trst", name: "trst", symbol: "trst", rank: "trst", price_usd: "trst", price_btc: "trst", volume_usd_24h: "trst", market_cap_usd: "trst", available_supply: "trst", total_supply: "trst", max_supply: "trst", percent_change_1h: "trst", percent_change_24h: "trst", percent_change_7d: "trst", last_updated: "trst", favorite: false)
        
        DB.updateOrAddData(data: crypto, completion: {
            XCTAssertTrue(DB.getAllData().count > 0)
        })
        
   //     XCTAssertTrue(DB.getAllData().count > 0)
        
    }
    

    
    override func tearDown() {
        DB.clearDB()
    }
}
