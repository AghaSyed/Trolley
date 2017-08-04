//
//  AllItemsCollectionViewCell.swift
//  TolleyApp
//
//  Created by Rashdan Natiq on 03/08/2017.
//  Copyright © 2017 Devclan. All rights reserved.
//

import UIKit

class AllItemsCollectionViewCell: UICollectionViewCell {
    var count = 0
    @IBOutlet weak var addItem: UIButton!
    @IBOutlet weak var allCountLabel: UILabel!
    @IBOutlet weak var hideView: UIView!
    @IBOutlet weak var allQuantityLabel: UILabel!
    @IBOutlet weak var allDetailLabel: UILabel!
    @IBOutlet weak var allPriceLabel: UILabel!
    @IBOutlet weak var allItemImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func addItemButton(_ sender: UIButton) {
        hideView.alpha = 0.7
        count = count + 1
        allCountLabel.text = "\(count)"
         Trolley.init().price = count
        
    }
    @IBAction func hideMinusButtonClicked(_ sender: UIButton) {
        count = count - 1
        if count == 0 {
            hideView.alpha = 0
        } else {
            allCountLabel.text = "\(count)"
             Trolley.init().price = count
        }
    }
    @IBAction func hideAddButtonClicked(_ sender: UIButton) {
        count = count + 1
        allCountLabel.text = "\(count)"
         Trolley.init().price = count
    }
}
