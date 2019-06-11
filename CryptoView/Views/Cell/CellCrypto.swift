//
//  Cell.swift
//  CryptoView
//
//  Created by Ilgiz Fazlyev on 10/06/2019.
//  Copyright © 2019 Ilgiz Fazlyev. All rights reserved.
//

import UIKit

class CellCrypto: UITableViewCell {
    
    @IBOutlet weak var priceBtcLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceUsdLabel: UILabel!
    @IBOutlet weak var favoriteImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setItem(_ item: LocalCrypto) {
        priceBtcLabel.text = item.price_btc
        nameLabel.text = item.name
        priceUsdLabel.text = item.price_usd
        favoriteImageView.isHidden = !item.favorite
    }
}
