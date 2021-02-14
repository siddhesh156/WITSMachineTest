//
//  TableViewCell.swift
//  iOSMachineTest1
//
//  Created by siddhesh on 13/02/21.
//  Copyright © 2021 siddhesh. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var images: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var header: UILabel!
    
    @IBOutlet weak var subHeader: UILabel!
    
    @IBOutlet weak var moreBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
