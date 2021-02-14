//
//  FirstViewController.swift
//  iOSMachineTest1
//
//  Created by siddhesh on 13/02/21.
//  Copyright © 2021 siddhesh. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DispatchQueue.main.async {
            // your code here
        
        Global.url = "http://www.witsindia.com/ftp/test/books.xml"
        print("1 ",Global.url)
        }
        
        }


}

