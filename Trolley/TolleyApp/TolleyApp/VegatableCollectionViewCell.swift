//
//  VegatableCollectionViewCell.swift
//  TolleyApp
//
//  Created by Rashdan Natiq on 02/08/2017.
//  Copyright © 2017 Devclan. All rights reserved.
//

import UIKit

class VegatableCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var vegImge: UIImageView!
    @IBOutlet weak var vegQantityLabel: UILabel!
    @IBOutlet weak var detailVegLabel: UILabel!
    @IBOutlet weak var vegPriceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func didTapAddButton(_ sender: Any) {
    }

}
