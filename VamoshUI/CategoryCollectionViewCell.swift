//
//  CategoryCollectionViewCell.swift
//  VamoshUI
//
//  Created by Annu Priya on 28/06/20.
//  Copyright © 2020 Annu Priya. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblCatName : UILabel!
    @IBOutlet weak var imgCategory : UIImageView!
}

extension UICollectionViewCell {
func shadowDecorate() {
    let radius: CGFloat = 10
    contentView.layer.cornerRadius = radius
    contentView.layer.borderWidth = 1
    contentView.layer.borderColor = UIColor.clear.cgColor
    contentView.layer.masksToBounds = true

    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOffset = CGSize(width: 0, height: 1.0)
    layer.shadowRadius = 2.0
    layer.shadowOpacity = 0.5
    layer.masksToBounds = false
    layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
    layer.cornerRadius = radius
}
}
