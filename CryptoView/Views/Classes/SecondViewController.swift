//
//  SecondViewController.swift
//  CryptoView
//
//  Created by Ilgiz Fazlyev on 11/06/2019.
//  Copyright © 2019 Ilgiz Fazlyev. All rights reserved.
//

import UIKit
import RealmSwift
import RxSwift
import RxCocoa
class SecondViewController: UIViewController {

    let bag = DisposeBag()
    var cryptoData: LocalCrypto!
    @IBOutlet weak var priceUsdLabel: UILabel!
    @IBOutlet weak var priceBtcLabel: UILabel!
    @IBOutlet weak var volumeUsd24hLabel: UILabel!
    @IBOutlet weak var marketCapUsdLabel: UILabel!
    @IBOutlet weak var availableSupplyLabel: UILabel!
    @IBOutlet weak var totalSupplyLabel: UILabel!
    @IBOutlet weak var maxSupplyLabel: UILabel!
    @IBOutlet weak var percentChange1hLabel: UILabel!
    @IBOutlet weak var percentChange24hLabel: UILabel!
    @IBOutlet weak var percentChange7dLabel: UILabel!
    @IBOutlet weak var lastUpdatedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        tapListeners()
    }
    
    func tapListeners(){
        
        self.navigationItem.rightBarButtonItems![0].rx.tap.subscribe(onNext: { [weak self] in
            guard let strongSelf = self else {
                return
            }
            strongSelf.updateDB()
            strongSelf.configureNavBar()
            
        }).disposed(by: bag)

    }
    

}
