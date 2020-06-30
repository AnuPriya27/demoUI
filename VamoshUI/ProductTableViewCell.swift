//
//  ProductTableViewCell.swift
//  VamoshUI
//
//  Created by Annu Priya on 29/06/20.
//  Copyright © 2020 Annu Priya. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layoutMargins = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
