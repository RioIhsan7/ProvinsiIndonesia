//
//  ProvinsiTableViewCell.swift
//  ProvinsIndonesia
//
//  Created by FatahKhair on 12/3/17.
//  Copyright © 2017 Rio Ihsan. All rights reserved.
//

import UIKit

class ProvinsiTableViewCell: UITableViewCell {
    @IBOutlet weak var nama: UILabel!
    @IBOutlet weak var gubernur: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
