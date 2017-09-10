//
//  PlayListCell.swift
//  iMaX Player
//
//  Created by SmartTaxi on 3/16/2560 BE.
//  Copyright © 2560 Rachanon Kwampien. All rights reserved.
//

import UIKit

class PlayListCell: UITableViewCell {

    @IBOutlet weak var lblInput: UILabel!
    @IBOutlet weak var lblHide: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
