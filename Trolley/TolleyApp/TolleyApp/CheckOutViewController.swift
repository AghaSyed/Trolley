//
//  CheckOutViewController.swift
//  TolleyApp
//
//  Created by Rashdan Natiq on 02/08/2017.
//  Copyright © 2017 Devclan. All rights reserved.
//

import UIKit

class CheckOutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var totalPriceMenuBar: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var myTabelView: UITableView!
    @IBOutlet weak var pageTitleLabel: UILabel!
    var totalPrice = 0
    var allItemInfo = [ItemInfo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        allItemInfo =   [ItemInfo(itemDetail: "Banana Banana", itemPrice: 3.5, itemQuantity: " 1 Kg", itemImage: #imageLiteral(resourceName: "banana")),
                         ItemInfo(itemDetail: "appricot appricot", itemPrice: 4.5, itemQuantity: " 1.5 Kg", itemImage: #imageLiteral(resourceName: "appricot")),
                         ItemInfo(itemDetail: "grap grap", itemPrice: 5.5, itemQuantity: " 2 Kg",itemImage: #imageLiteral(resourceName: "grap")),
                         ItemInfo(itemDetail: "pear pear", itemPrice: 6.5, itemQuantity: " 2.5 Kg",itemImage: #imageLiteral(resourceName: "pear")),
                         ItemInfo(itemDetail: "celiflower celiflower", itemPrice: 3.5, itemQuantity: " 1 Kg", itemImage: #imageLiteral(resourceName: "celiflower")),
                         ItemInfo(itemDetail: "mixVeg mixVeg", itemPrice: 4.5, itemQuantity: " 1.5 Kg", itemImage: #imageLiteral(resourceName: "mixVeg")),
                         ItemInfo(itemDetail: "carrot carrot", itemPrice: 5.5, itemQuantity: " 2 Kg",itemImage: #imageLiteral(resourceName: "carrot")),
                         ItemInfo(itemDetail: "tomato tomato", itemPrice: 6.5, itemQuantity: " 2.5 Kg",itemImage: #imageLiteral(resourceName: "tomato"))]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tollyButtonPressed(_ sender: UIButton) {
    }
    @IBAction func didTapCheckOutButton(_ sender: UIButton) {
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allItemInfo.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("SearchItemTableViewCell", owner: self, options: nil)?.first as! SearchItemTableViewCell
        cell.addSubView.layer.cornerRadius = 7
        cell.addSubView.layer.borderWidth = 1
        cell.countLabel.layer.borderWidth = 1
        cell.backGroundView.layer.cornerRadius = 10
        cell.backGroundView.layer.borderWidth = 1
        cell.backGroundView.layer.borderColor = UIColor.gray.cgColor
        cell.detailLabel.text = allItemInfo[indexPath.row].itemDetail
        cell.itemImage.image = allItemInfo[indexPath.row].itemImage
        cell.priceLabel.text = "\(allItemInfo[indexPath.row].itemPrice!) AED"
        cell.weightLabel.text = allItemInfo[indexPath.row].itemQuantity
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
           allItemInfo.remove(at: indexPath.row)
            myTabelView.deleteRows(at: [indexPath], with: .fade)
            myTabelView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
}
