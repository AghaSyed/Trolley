//
//  SearchViewController.swift
//  TolleyApp
//
//  Created by Rashdan Natiq on 02/08/2017.
//  Copyright © 2017 Devclan. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate , UISearchBarDelegate{

    @IBOutlet weak var pageTitleLabel: UILabel!
    @IBOutlet weak var trolleyLabel: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var myTabelView: UITableView!
    var totalPrice = 0
    var allItemInfo = [ItemInfo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        myTabelView.delegate = self
        myTabelView.dataSource = self
        allItemInfo =   [ItemInfo(itemDetail: "Banana Banana", itemPrice: "3.5 AED", itemQuantity: " 1 Kg", itemImage: #imageLiteral(resourceName: "banana")),
                         ItemInfo(itemDetail: "appricot appricot", itemPrice: "4.5 AED", itemQuantity: " 1.5 Kg", itemImage: #imageLiteral(resourceName: "appricot")),
                         ItemInfo(itemDetail: "grap grap", itemPrice: "5.5 AED", itemQuantity: " 2 Kg",itemImage: #imageLiteral(resourceName: "grap")),
                         ItemInfo(itemDetail: "pear pear", itemPrice: "6.5 AED", itemQuantity: " 2.5 Kg",itemImage: #imageLiteral(resourceName: "pear")),
                         ItemInfo(itemDetail: "celiflower celiflower", itemPrice: "3.5 AED", itemQuantity: " 1 Kg", itemImage: #imageLiteral(resourceName: "celiflower")),
                         ItemInfo(itemDetail: "mixVeg mixVeg", itemPrice: "4.5 AED", itemQuantity: " 1.5 Kg", itemImage: #imageLiteral(resourceName: "mixVeg")),
                         ItemInfo(itemDetail: "carrot carrot", itemPrice: "5.5 AED", itemQuantity: " 2 Kg",itemImage: #imageLiteral(resourceName: "carrot")),
                         ItemInfo(itemDetail: "tomato tomato", itemPrice: "6.5 AED", itemQuantity: " 2.5 Kg",itemImage: #imageLiteral(resourceName: "tomato"))]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func didTapMenuButton(_ sender: UIButton) {
    }
    @IBAction func didTapTrolleyButton(_ sender: UIButton) {
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchBar.text == "" {
            return 0
        } else {
            return allItemInfo.count
        }
        
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
        cell.priceLabel.text = allItemInfo[indexPath.row].itemPrice
        cell.weightLabel.text = allItemInfo[indexPath.row].itemQuantity
        return cell

    }
    // Search Bar Function
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text == "" {
        } else {
            myTabelView.reloadData()
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if searchBar.text == "" {
        } else {
            myTabelView.reloadData()
        }
    }

}
