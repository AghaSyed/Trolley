//
//  SearchItemTableViewCell.swift
//  TolleyApp
//
//  Created by Rashdan Natiq on 03/08/2017.
//  Copyright © 2017 Devclan. All rights reserved.
//

import UIKit

class SearchItemTableViewCell: UITableViewCell {
    var count = 0
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var addSubView: UIView!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func didTapReduceButton(_ sender: UIButton) {
        if count == 0 {
            
        } else {
            count = count - 1
            countLabel.text = "\(count)"
        }
    }
    @IBAction func didTapAddButton(_ sender: UIButton) {
        count = count + 1
        countLabel.text = "\(count)"
    }
}
