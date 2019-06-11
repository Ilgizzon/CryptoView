//
//  DoubleExtension.swift
//  CryptoView
//
//  Created by Ilgiz Fazlyev on 10/06/2019.
//  Copyright © 2019 Ilgiz Fazlyev. All rights reserved.
//

import UIKit

extension Double{
    
    // returns the date formatted according to the format string provided.
    func dateFormatted(withFormat format : String) -> String{
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
}
