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
    
    private static let DBQueue = DispatchQueue(label: "DB thread", attributes: .concurrent)
    
    static func updateOrAddData(data: [LocalCrypto]?){
        
        DBQueue.async {
            autoreleasepool {
                guard let strongData = data else {
                    return
                }
                
                let realm = Realm.db
                for crypto in strongData {
                    let oldData = getDataById(id: crypto.id ?? "")
                    crypto.favorite = oldData?.favorite ?? false
                    let realmCrypto = RealmCrypto(from: crypto)
                    try! realm.write {
                        realm.add(realmCrypto, update: true)
                    }
                }
            }
        }
    }
    
    static func updateOrAddData(data: LocalCrypto?, completion: @escaping () -> Void  = {}){
        
        DBQueue.async {
            autoreleasepool {
                guard let strongData = data else {
                    completion()
                    return
                }
                
                let realm = Realm.db
                let realmCrypto = RealmCrypto(from: strongData)
                try! realm.write {
                    realm.add(realmCrypto, update: true)
                    completion()
                }
            }
        }
        
    }
    
    static func getFavoriteData() -> Results <RealmCrypto>{
        return Realm.db.objects(RealmCrypto.self).filter("favorite == true")
    }
    
    static func getDataById(id: String) -> RealmCrypto? {
        return Realm.db.object(ofType: RealmCrypto.self, forPrimaryKey: id)
    }
    
    static func getAllData() -> Results <RealmCrypto>{
        return Realm.db.objects(RealmCrypto.self)
    }
    
    static func clearDB(){
        DBQueue.async {
            autoreleasepool {
                let realm = Realm.db
                try! realm.write {
                    realm.deleteAll()
                }
            }
        }
    }
}
