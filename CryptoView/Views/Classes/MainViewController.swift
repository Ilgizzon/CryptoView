//
//  ViewController.swift
//  CryptoView
//
//  Created by Ilgiz Fazlyev on 09/06/2019.
//  Copyright © 2019 Ilgiz Fazlyev. All rights reserved.
//

import UIKit
import RealmSwift
import RxSwift
import RxCocoa
class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var realmToken: NotificationToken? = nil
    var cryptoList: Results<RealmCrypto>? = DB.getAllData()
    var timer: Timer?
    var runTimer: Bool = false
    let bag = DisposeBag()
    
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
            strongSelf.makeRequest()

        }).disposed(by: bag)

        self.navigationItem.rightBarButtonItems![1].rx.tap.subscribe(onNext: {  _ in
            Alert.settings {
                self.syncWithSettings()
            }

        }).disposed(by: bag)
    }
    override func viewDidAppear(_ animated: Bool) {
        syncWithSettings()
        makeRequest(uiTap: true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        realmToken?.invalidate()
        timer?.invalidate()
    }
    
}

