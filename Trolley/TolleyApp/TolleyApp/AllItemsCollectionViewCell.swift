//
//  AllItemsCollectionViewCell.swift
//  TolleyApp
//
//  Created by Rashdan Natiq on 03/08/2017.
//  Copyright © 2017 Devclan. All rights reserved.
//

import UIKit


class ItemCollectionCell: UICollectionViewCell {
    var clickHandler: ((Int)->Void)?
    func watchForClickHandler(completion: @escaping (Int)->Void) {
        self.clickHandler = completion
    }
}

class AllItemsCollectionViewCell: ItemCollectionCell {
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
        guard let completion = self.clickHandler else {return}
        completion(0)
    }
    @IBAction func hideMinusButtonClicked(_ sender: UIButton) {
        count = count - 1
        if count == 0 {
            hideView.alpha = 0
        } else {
            allCountLabel.text = "\(count)"
             Trolley.init().price = count 
        }
        guard let completion = self.clickHandler else {return}
        completion(1)
    }
    @IBAction func hideAddButtonClicked(_ sender: UIButton) {
        count = count + 1
        allCountLabel.text = "\(count)"
         Trolley.init().price = count
        guard let completion = self.clickHandler else {return}
        completion(0)
    }
}
