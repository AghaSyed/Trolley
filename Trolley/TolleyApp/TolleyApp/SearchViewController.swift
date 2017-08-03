//
//  SearchViewController.swift
//  TolleyApp
//
//  Created by Rashdan Natiq on 02/08/2017.
//  Copyright © 2017 Devclan. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var pageTitleLabel: UILabel!
    @IBOutlet weak var trolleyLabel: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var myTabelView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTabelView.delegate = self
        myTabelView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func didTapMenuButton(_ sender: UIButton) {
    }
    @IBAction func didTapTrolleyButton(_ sender: UIButton) {
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("SearchItemTableViewCell", owner: self, options: nil)?.first as! SearchItemTableViewCell
        cell.addSubView.layer.cornerRadius = 12
        cell.addSubView.layer.borderWidth = 1
        cell.countLabel.layer.borderWidth = 1
        cell.backGroundView.layer.cornerRadius = 10
        cell.backGroundView.layer.borderWidth = 1
        cell.backGroundView.layer.borderColor = UIColor.gray.cgColor
        return cell
    }
}
