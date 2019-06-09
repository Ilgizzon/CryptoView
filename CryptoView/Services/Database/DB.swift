//
//  DB.swift
//  CryptoView
//
//  Created by Ilgiz Fazlyev on 09/06/2019.
//  Copyright © 2019 Ilgiz Fazlyev. All rights reserved.
//

import Foundation
import RealmSwift

class DB {
    
    static func updateOrAddData(data: [LocalCrypto]?){
        let realm = Realm.db
        realm.beginWrite()
        guard let strongData = data else {
            realm.cancelWrite()
            return
        }
        
        for crypto in strongData {
            let realmCrypto = RealmCrypto(from: crypto)
            realm.add(realmCrypto, update: true)
        }
        realm.cancelWrite()
    }
    
    static func updateOrAddData(data: LocalCrypto?){
        let realm = Realm.db
        realm.beginWrite()
        guard let strongData = data else {
            realm.cancelWrite()
            return
        }
        let realmCrypto = RealmCrypto(from: strongData)
        realm.add(realmCrypto, update: true)
        realm.cancelWrite()
    }
    
    static func getFavoriteData() -> Results <RealmCrypto>{
        return Realm.db.objects(RealmCrypto.self).filter("favorite == true")
    }
}
