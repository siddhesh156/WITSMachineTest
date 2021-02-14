//
//  TabBarViewController.swift
//  iOSMachineTest1
//
//  Created by siddhesh on 14/02/21.
//  Copyright © 2021 siddhesh. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController,UITabBarControllerDelegate {

    @IBOutlet weak var tabBarView: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
       print("first")
        let x = XMLWrapperController()
        x.api()
        
        // Do any additional setup after loading the view.
    }
    

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let indexOfTab = tabBar.items?.index(of: item)
        print("pressed tabBar: \(String(describing: indexOfTab))")
        
        Global.indexTab = indexOfTab!
        
        if(indexOfTab == 0){
             Global.url = "http://www.witsindia.com/ftp/test/books.xml"
        }
        else if(indexOfTab == 1){
            Global.url = "http://www.witsindia.com/ftp/test/music.xml"
            if(Global.music1.count==0){
                let x = XMLWrapperController()
                x.api()
            }
        }
        else if(indexOfTab == 2){
            Global.url = "http://www.witsindia.com/ftp/test/games.xml"
            if(Global.game1.count==0){
                let x = XMLWrapperController()
                x.api()
            }
        }
    }

}
