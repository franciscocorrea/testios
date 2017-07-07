//
//  ShopTableViewController.swift
//  firsttestios
//
//  Created by Anibal Francisco Correa on 6/7/17.
//  Copyright © 2017 Anibal Francisco Correa. All rights reserved.
//

import Foundation
import UIKit

class ShopViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    private var productShopCart: [(Product, Int)] = []
    
    
    func setShoppingProducts(_ shopCart: [(Product, Int)]) {
        productShopCart = shopCart
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productShopCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shopTableViewCell") as? ShopTableViewCell else {
            return UITableViewCell()
        }
        
        let product = productShopCart[indexPath.row].0
        let cant = productShopCart[indexPath.row].1
        cell.fillData(nameProduct: product.name, cantProduct: cant)
        
        return cell
    }
    
}


