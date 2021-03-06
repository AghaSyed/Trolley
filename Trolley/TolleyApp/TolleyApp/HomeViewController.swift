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
    var totalPrice = 0.0
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
        fruitInfo = [ItemInfo(itemId: "0001",itemDetail: "Banana Banana", itemPrice: 3.5, itemQuantity: " 1 Kg", itemImage: #imageLiteral(resourceName: "banana")),
                    ItemInfo(itemId: "0002", itemDetail: "appricot appricot", itemPrice: 4.5 , itemQuantity: " 1.5 Kg", itemImage: #imageLiteral(resourceName: "appricot")),
                    ItemInfo(itemId: "0003", itemDetail: "grap grap", itemPrice: 5.5, itemQuantity: " 2 Kg",itemImage: #imageLiteral(resourceName: "grap")),
                    ItemInfo( itemId: "0004", itemDetail: "pear pear", itemPrice: 6.5, itemQuantity: " 2.5 Kg",itemImage: #imageLiteral(resourceName: "pear"))]
     
        vegetableInfo = [ ItemInfo(itemId: "0011", itemDetail: "celiflower celiflower", itemPrice: 3.5, itemQuantity: " 1 Kg", itemImage: #imageLiteral(resourceName: "celiflower")),
                         ItemInfo(itemId: "0012", itemDetail: "mixVeg mixVeg", itemPrice: 4.5, itemQuantity: " 1.5 Kg", itemImage: #imageLiteral(resourceName: "mixVeg")),
                         ItemInfo(itemId: "0013", itemDetail: "carrot carrot", itemPrice: 5.5, itemQuantity: " 2 Kg",itemImage: #imageLiteral(resourceName: "carrot")),
                         ItemInfo(itemId: "0014", itemDetail: "tomato tomato", itemPrice: 6.5, itemQuantity: " 2.5 Kg",itemImage: #imageLiteral(resourceName: "tomato"))]
       
        allItemInfo =   [ItemInfo(itemId: "0001",itemDetail: "Banana Banana", itemPrice: 3.5, itemQuantity: " 1 Kg", itemImage: #imageLiteral(resourceName: "banana")),
                         ItemInfo(itemId: "0002", itemDetail: "appricot appricot", itemPrice: 4.5 , itemQuantity: " 1.5 Kg", itemImage: #imageLiteral(resourceName: "appricot")),
                         ItemInfo(itemId: "0003", itemDetail: "grap grap", itemPrice: 5.5, itemQuantity: " 2 Kg",itemImage: #imageLiteral(resourceName: "grap")),
                         ItemInfo( itemId: "0004", itemDetail: "pear pear", itemPrice: 6.5, itemQuantity: " 2.5 Kg",itemImage: #imageLiteral(resourceName: "pear")),
                         ItemInfo(itemId: "0011", itemDetail: "celiflower celiflower", itemPrice: 3.5, itemQuantity: " 1 Kg", itemImage: #imageLiteral(resourceName: "celiflower")),
                         ItemInfo(itemId: "0012", itemDetail: "mixVeg mixVeg", itemPrice: 4.5, itemQuantity: " 1.5 Kg", itemImage: #imageLiteral(resourceName: "mixVeg")),
                         ItemInfo(itemId: "0013", itemDetail: "carrot carrot", itemPrice: 5.5, itemQuantity: " 2 Kg",itemImage: #imageLiteral(resourceName: "carrot")),
                         ItemInfo(itemId: "0014", itemDetail: "tomato tomato", itemPrice: 6.5, itemQuantity: " 2.5 Kg",itemImage: #imageLiteral(resourceName: "tomato"))]

   
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
    func didTabButton(button: UIButton)  {
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isFruit == true {
            self.myCollectionView.register(UINib(nibName: "AllItemsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "allItemCollection")
            let cell : AllItemsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "allItemCollection", for: indexPath) as! AllItemsCollectionViewCell
            
            cell.allItemImage.image = fruitInfo[indexPath.row].itemImage
            cell.allPriceLabel.text =  "\(fruitInfo[indexPath.row].itemPrice!) AED"
            cell.allDetailLabel.text = fruitInfo[indexPath.row].itemDetail
            cell.allQuantityLabel.text = fruitInfo[indexPath.row].itemQuantity
            cell.layer.cornerRadius = 15
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.gray.cgColor
            cell.allPriceLabel.layer.borderWidth = 1
            cell.allPriceLabel.layer.cornerRadius = 4
            cell.allPriceLabel.layer.borderColor = UIColor.gray.cgColor
            cell.watchForClickHandler(completion: {index in
                let clickedItemPrice = self.fruitInfo[indexPath.row].itemPrice
                
                if index == 0 {
                    self.totalPrice += clickedItemPrice!
                }else {
                    self.totalPrice -= clickedItemPrice!
                    if self.totalPrice < 0 {
                        self.totalPrice = 0.0
                    }
                }
                
                self.homeTotalPrice.text = "\(self.totalPrice)"
            })
            return cell
        } else if isVegetable == true {
            self.myCollectionView.register(UINib(nibName: "AllItemsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "allItemCollection")
            let cell : AllItemsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "allItemCollection", for: indexPath) as! AllItemsCollectionViewCell
            cell.allItemImage.image = vegetableInfo[indexPath.row].itemImage
            cell.allPriceLabel.text = "\(vegetableInfo[indexPath.row].itemPrice!) AED"
            cell.allQuantityLabel.text = vegetableInfo[indexPath.row].itemQuantity
            cell.allDetailLabel.text = vegetableInfo[indexPath.row].itemDetail
            cell.layer.borderColor = UIColor.gray.cgColor
            cell.layer.cornerRadius = 15
            cell.layer.borderWidth = 1
            cell.allPriceLabel.layer.borderWidth = 1
            cell.allPriceLabel.layer.cornerRadius = 4
            cell.allPriceLabel.layer.borderColor = UIColor.gray.cgColor
            cell.watchForClickHandler(completion: {index in
                let clickedItemPrice = self.vegetableInfo[indexPath.row].itemPrice
                
                if index == 0 {
                    self.totalPrice += clickedItemPrice!
                }else {
                    self.totalPrice -= clickedItemPrice!
                    if self.totalPrice < 0 {
                        self.totalPrice = 0.0
                    }
                }
                
                self.homeTotalPrice.text = "\(self.totalPrice)"
            })
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
            cell.allPriceLabel.layer.borderColor = UIColor.gray.cgColor
            cell.watchForClickHandler(completion: {index in
            cell.addItem.tag = indexPath.row
                self.didTabButton(button: cell.addItem)
                let clickedItemPrice = self.allItemInfo[indexPath.row].itemPrice
                if index == 0 {
                    cell.hideView.alpha = 0.7
                    self.totalPrice += clickedItemPrice!
                    cell.count = cell.count + 1
                    cell.allCountLabel.text = "\(cell.count)"
                }else {
                    self.totalPrice -= clickedItemPrice!
                    cell.count = cell.count - 1
                    if cell.count < 1 {
                       cell.hideView.alpha = 0  
                    } else {
                        cell.allCountLabel.text = "\(cell.count)"
                    }
                    if self.totalPrice < 0 {
                        self.totalPrice = 0.0
                    }
                }
                
                self.homeTotalPrice.text = "\(self.totalPrice)"
            })
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
