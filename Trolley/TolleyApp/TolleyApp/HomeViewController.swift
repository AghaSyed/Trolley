//
//  HomeViewController.swift
//  TolleyApp
//
//  Created by Rashdan Natiq on 02/08/2017.
//  Copyright © 2017 Devclan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // OutLets
    
    @IBOutlet weak var vegetableButton: UIButton!
    @IBOutlet weak var fruitButton: UIButton!
    @IBOutlet weak var allItemButton: UIButton!

    @IBOutlet weak var myCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        self.myCollectionView.register(UINib(nibName: "VegatableCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "vegCollection")
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Collection View Function
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : VegatableCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "vegCollection", for: indexPath) as! VegatableCollectionViewCell
        cell.layer.cornerRadius = 15
        cell.layer.borderWidth = 2
        return cell
    }
    // Outlet Function
    
    @IBAction func allItemSelected(_ sender: UIButton) {
    }
    @IBAction func fruitSelected(_ sender: UIButton) {
    }
    @IBAction func vegetableSelected(_ sender: UIButton) {
    }
    
    
}
