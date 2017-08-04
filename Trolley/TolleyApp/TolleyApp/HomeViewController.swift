//
//  HomeViewController.swift
//  TolleyApp
//
//  Created by Rashdan Natiq on 02/08/2017.
//  Copyright © 2017 Devclan. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    
   
    
    // OutLets
    @IBOutlet weak var trollyButton: UIButton!
    @IBOutlet weak var homeTotalPrice: UILabel!
    @IBOutlet weak var mySearchBar: UISearchBar!
    @IBOutlet weak var vegetableView: UIView!
    @IBOutlet weak var fruitView: UIView!
    @IBOutlet weak var allItemView: UIView!
    @IBOutlet weak var vegetableButton: UIButton!
    @IBOutlet weak var fruitButton: UIButton!
    @IBOutlet weak var allItemButton: UIButton!
    @IBOutlet weak var myCollectionView: UICollectionView!
    // Declar Variables
    var totalPrice = 0
    var fruitInfo = [ItemInfo]()
    var vegetableInfo = [ItemInfo]()
    var allItemInfo = [ItemInfo]()
    var isFruit = false
    var isVegetable = false
    var allItem = true
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        fruitInfo = [ItemInfo(itemDetail: "Banana Banana", itemPrice: 3.5, itemQuantity: " 1 Kg", itemImage: #imageLiteral(resourceName: "banana")),
                    ItemInfo(itemDetail: "appricot appricot", itemPrice: 4.5 , itemQuantity: " 1.5 Kg", itemImage: #imageLiteral(resourceName: "appricot")),
                    ItemInfo(itemDetail: "grap grap", itemPrice: 5.5, itemQuantity: " 2 Kg",itemImage: #imageLiteral(resourceName: "grap")),
                    ItemInfo(itemDetail: "pear pear", itemPrice: 6.5, itemQuantity: " 2.5 Kg",itemImage: #imageLiteral(resourceName: "pear"))]
     
        vegetableInfo = [ItemInfo(itemDetail: "celiflower celiflower", itemPrice: 3.5, itemQuantity: " 1 Kg", itemImage: #imageLiteral(resourceName: "celiflower")),
                         ItemInfo(itemDetail: "mixVeg mixVeg", itemPrice: 4.5, itemQuantity: " 1.5 Kg", itemImage: #imageLiteral(resourceName: "mixVeg")),
                         ItemInfo(itemDetail: "carrot carrot", itemPrice: 5.5, itemQuantity: " 2 Kg",itemImage: #imageLiteral(resourceName: "carrot")),
                         ItemInfo(itemDetail: "tomato tomato", itemPrice: 6.5, itemQuantity: " 2.5 Kg",itemImage: #imageLiteral(resourceName: "tomato"))]
       
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
    // Collection View Function
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFruit == true {
           return fruitInfo.count
        } else if isVegetable == true {
             return vegetableInfo.count
        } else {
           return allItemInfo.count
        }
        
    }
   /* func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if isFruit == true {
          
          return true
        } else if isVegetable == true {
             return true
        } else {
            return true
        }
    }*/
    override func viewWillAppear(_ animated: Bool) {
        mySearchBar.resignFirstResponder()
    }
    override func viewWillDisappear(_ animated: Bool) {
        mySearchBar.resignFirstResponder()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isFruit == true {
            self.myCollectionView.register(UINib(nibName: "FruitCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "fruitCollection")
            let cell : FruitCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "fruitCollection", for: indexPath) as! FruitCollectionViewCell
            cell.fruitImage.image = fruitInfo[indexPath.row].itemImage
            cell.priceLabel.text =  "\(fruitInfo[indexPath.row].itemPrice!) AED"
            cell.fruitDetailLabel.text = fruitInfo[indexPath.row].itemDetail
            cell.fruitQuantityLabel.text = fruitInfo[indexPath.row].itemQuantity
            cell.layer.cornerRadius = 15
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.gray.cgColor
            cell.priceLabel.layer.borderWidth = 1
            cell.priceLabel.layer.cornerRadius = 4
            cell.priceLabel.layer.borderColor = UIColor.gray.cgColor
            return cell
        } else if isVegetable == true {
            self.myCollectionView.register(UINib(nibName: "VegatableCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "vegCollection")
            let cell : VegatableCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "vegCollection", for: indexPath) as! VegatableCollectionViewCell
            cell.vegImge.image = vegetableInfo[indexPath.row].itemImage
            cell.vegPriceLabel.text = "\(vegetableInfo[indexPath.row].itemPrice!) AED"
            cell.vegQantityLabel.text = vegetableInfo[indexPath.row].itemQuantity
            cell.detailVegLabel.text = vegetableInfo[indexPath.row].itemDetail
            cell.layer.borderColor = UIColor.gray.cgColor
            cell.layer.cornerRadius = 15
            cell.layer.borderWidth = 1
            cell.vegPriceLabel.layer.borderWidth = 1
            cell.vegPriceLabel.layer.cornerRadius = 4
            cell.vegPriceLabel.layer.borderColor = UIColor.gray.cgColor
            return cell
        } else {
            self.myCollectionView.register(UINib(nibName: "AllItemsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "allItemCollection")
            let cell : AllItemsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "allItemCollection", for: indexPath) as! AllItemsCollectionViewCell
            cell.allItemImage.image = allItemInfo[indexPath.row].itemImage
            cell.allDetailLabel.text = allItemInfo[indexPath.row].itemDetail
            cell.allPriceLabel.text = "\(allItemInfo[indexPath.row].itemPrice!) AED"
            cell.allQuantityLabel.text = allItemInfo[indexPath.row].itemQuantity
            cell.layer.cornerRadius = 15
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.gray.cgColor
            cell.allPriceLabel.layer.borderWidth = 1
            cell.allPriceLabel.layer.cornerRadius = 4
            self.homeTotalPrice.text = "\(cell.count)"
            cell.allPriceLabel.layer.borderColor = UIColor.gray.cgColor
            
            return cell
        }
    }
    
  // Search Bar Fuctions
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SearchProductViewController") as! SearchProductViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
        mySearchBar.resignFirstResponder()
    }
    // Outlet Function
  
    @IBAction func allItemSelected(_ sender: UIButton) {
        allItemButton.setTitleColor(UIColor.green, for: UIControlState.normal)
        fruitButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        vegetableButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        allItemView.backgroundColor = UIColor.green
        fruitView.backgroundColor = UIColor.white
        vegetableView.backgroundColor = UIColor.white
        isVegetable = false
        isFruit = false
        myCollectionView.reloadData()
    }
    @IBAction func fruitSelected(_ sender: UIButton) {
        allItemButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        fruitButton.setTitleColor(UIColor.green, for: UIControlState.normal)
        vegetableButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        allItemView.backgroundColor = UIColor.white
        fruitView.backgroundColor = UIColor.green
        vegetableView.backgroundColor = UIColor.white
        isVegetable = false
        isFruit = true
        myCollectionView.reloadData()
    }
    @IBAction func vegetableSelected(_ sender: UIButton) {
        allItemButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        fruitButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        vegetableButton.setTitleColor(UIColor.green, for: UIControlState.normal)
        allItemView.backgroundColor = UIColor.white
        fruitView.backgroundColor = UIColor.white
        vegetableView.backgroundColor = UIColor.green
        isVegetable = true
        isFruit = false
        myCollectionView.reloadData()
    }
    @IBAction func didTapTrolleyButton(_ sender: UIButton) {
        
    }
    
}
