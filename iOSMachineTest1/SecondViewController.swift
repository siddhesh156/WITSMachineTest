//
//  SecondViewController.swift
//  iOSMachineTest1
//
//  Created by siddhesh on 13/02/21.
//  Copyright © 2021 siddhesh. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Global.url = "http://www.witsindia.com/ftp/test/music.xml"
        print("2 ",Global.url)
    }


}

