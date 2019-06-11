//
//  ViewControllerIteractor.swift
//  CryptoView
//
//  Created by Ilgiz Fazlyev on 10/06/2019.
//  Copyright © 2019 Ilgiz Fazlyev. All rights reserved.
//

import Foundation

extension MainViewController{
    
    
    
    private func configureRealm() {
        
        realmToken = cryptoList?.observe { [weak self] change in
            
            guard let strongSelf = self else {
                return
            }
            strongSelf.removeSpinner()
         
            switch change {
            case .initial:
                // Results are now populated and can be accessed without blocking the UI
                strongSelf.tableView.reloadData()
            case .update(
                _,
                let deletions,
                let insertions,
                let modifications
                ):
                
                // Query results have changed, so apply them to the UITableView
                strongSelf.tableView.beginUpdates()
                strongSelf.tableView.insertRows(
                    at: insertions.map({ IndexPath(row: $0, section: 0) }),
                    with: .automatic
                )
                
                strongSelf.tableView.deleteRows(
                    at: deletions.map({ IndexPath(row: $0, section: 0)}),
                    with: .automatic
                )
                
                strongSelf.tableView.reloadRows(
                    at: modifications.map({ IndexPath(row: $0, section: 0) }),
                    with: .automatic
                )
                
                strongSelf.tableView.endUpdates()
                
            case .error(let error):
                Alert.message(
                    description: error.localizedDescription,
                    type: .Error
                )
            }
        }
    }
    
    @objc func makeRequest(uiTap: Bool = false){
        if uiTap  {
            timer?.invalidate()
        }
        if runTimer {
            reLoader()
        }
        self.showSpinner(onView: self.view)
        Network.getCryptoList{ [weak self] error in
            guard let strongSelf = self else {
                return
            }
            strongSelf.removeSpinner()
            print(error)
            Alert.message(
                description: error,
                type: .Error
            )
            strongSelf.reLoader()
        }
    }
    

    func syncWithSettings(){
        runTimer = UserSettings.getAutoRefreshStatus()
        reLoader()
        if UserSettings.getFavoriteListStatus() {
            cryptoList = DB.getFavoriteData()
        } else {
            cryptoList = DB.getAllData()
        }
        realmToken?.invalidate()
        configureRealm()
    }
    
    
    private func reLoader(){
        if runTimer {
            timer = Timer.scheduledTimer(
                timeInterval: 15,
                target: self,
                selector: #selector(makeRequest),
                userInfo: nil,
                repeats: false
            )
        }
    }
}
