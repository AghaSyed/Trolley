//
//  FruitCollectionViewCell.swift
//  TolleyApp
//
//  Created by Rashdan Natiq on 02/08/2017.
//  Copyright © 2017 Devclan. All rights reserved.
//

import UIKit

class FruitCollectionViewCell: ItemCollectionCell {
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var fruitImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var fruitQuantityLabel: UILabel!
    @IBOutlet weak var fruitDetailLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var hideView: UIView!
    
    var count = 0
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func didTapHideViewAddButton(_ sender: UIButton) {
        count = count + 1
        countLabel.text = "\(count)"
        guard let completion = self.clickHandler else {return}
        completion(0)
    }
    @IBAction func didTapMinusButton(_ sender: UIButton) {
        count = count - 1
        if count == 0 {
            hideView.alpha = 0
        } else {
            countLabel.text = "\(count)"
        }
        guard let completion = self.clickHandler else {return}
        completion(1)
    }
    @IBAction func didTapAddButton(_ sender: UIButton) {
        hideView.alpha = 0.7
        count = count + 1
        countLabel.text = "\(count)"
        guard let completion = self.clickHandler else {return}
        completion(0)
    }
}
