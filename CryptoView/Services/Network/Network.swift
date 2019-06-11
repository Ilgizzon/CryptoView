//
//  Network.swift
//  CryptoView
//
//  Created by Ilgiz Fazlyev on 09/06/2019.
//  Copyright © 2019 Ilgiz Fazlyev. All rights reserved.
//

import Foundation
import Alamofire

class Network {
   
    static func getCryptoList(completion: @escaping (String) -> Void) {
        
        AF.request(Constants.URL, method: .get).responseDecodable{(response: DataResponse <[LocalCrypto]>)  in
            
            switch response.result {
            case .success(let data):
            //    print(data.debugDescription)
                DB.updateOrAddData(data: data)
            case .failure(let error):
                completion(error.localizedDescription)
            }
        }
        
    }
}
