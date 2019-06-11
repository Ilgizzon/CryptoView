//
//  ViewController+TableView.swift
//  CryptoView
//
//  Created by Ilgiz Fazlyev on 10/06/2019.
//  Copyright © 2019 Ilgiz Fazlyev. All rights reserved.
//

import UIKit

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let crypto = cryptoList?[indexPath.row].convert() else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CELL_XIB, for: indexPath) as! CellCrypto
        cell.setItem(crypto)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let crypto = cryptoList?[indexPath.row].convert() else {
            return
        }
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        vc.cryptoData = crypto
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
