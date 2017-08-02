//
//  VegatableCollectionViewCell.swift
//  TolleyApp
//
//  Created by Rashdan Natiq on 02/08/2017.
//  Copyright © 2017 Devclan. All rights reserved.
//

import UIKit

class VegatableCollectionViewCell: UICollectionViewCell {
    var count = 0
    @IBOutlet weak var countLable: UILabel!
    @IBOutlet weak var hideView: UIView!
    @IBOutlet weak var vegImge: UIImageView!
    @IBOutlet weak var vegQantityLabel: UILabel!
    @IBOutlet weak var detailVegLabel: UILabel!
    @IBOutlet weak var vegPriceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func didTapAddButton(_ sender: Any) {
        hideView.alpha = 0.7
        count = count + 1
        countLable.text = "\(count)"
    }
    @IBAction func didTapHideButton(_ sender: UIButton) {
        count = count - 1
        if count == 0 {
           hideView.alpha = 0
        } else {
            countLable.text = "\(count)"
        }
        
        
    }
    @IBAction func didTapHideViewAddButton(_ sender: UIButton) {
        count = count + 1
        countLable.text = "\(count)"
    }

}
