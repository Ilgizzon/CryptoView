//
//  ViewController+UI.swift
//  CryptoView
//
//  Created by Ilgiz Fazlyev on 10/06/2019.
//  Copyright © 2019 Ilgiz Fazlyev. All rights reserved.
//

import Foundation
import UIKit


extension MainViewController{
    
    func configureUI() {
        tableView.register(
            UINib(
                nibName: Constants.CELL_XIB,
                bundle: nil
            ),
            forCellReuseIdentifier: Constants.CELL_XIB
        )
        tableView.tableFooterView = UIView()
    }

}
