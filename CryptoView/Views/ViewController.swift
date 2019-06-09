//
//  ViewController.swift
//  CryptoView
//
//  Created by Ilgiz Fazlyev on 09/06/2019.
//  Copyright © 2019 Ilgiz Fazlyev. All rights reserved.
//

import UIKit
import Alertift
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.showSpinner(onView: self.view)
        Network.getCryptoList{ error in
            self.removeSpinner()
            print(error)
            Alert.message(description: error, type: .Error)
        }
    }


}

