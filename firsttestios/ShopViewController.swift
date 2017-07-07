//
//  ShopTableViewController.swift
//  firsttestios
//
//  Created by Anibal Francisco Correa on 6/7/17.
//  Copyright © 2017 Anibal Francisco Correa. All rights reserved.
//

import Foundation
import UIKit

protocol ShopViewControllerDelegate: class {
    func shopViewController(productToRemoveFromCart product: Product)
}

class ShopViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ShopTableViewCellDelegate {
    
    @IBOutlet weak var cartTableView: UITableView!
    
    weak var delegate: ShopViewControllerDelegate?
    
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
        cell.delegate = self
        
        return cell
    }
 
    func shopTableViewCell(removeActionFor cell: ShopTableViewCell) {
        guard let indexPath = cartTableView.indexPath(for: cell) else { return }
        var productTuple = productShopCart[indexPath.row]
        guard productTuple.1 > 0 else { return }
        productTuple.1 -= 1
        print(productTuple.1)
        cartTableView.reloadRows(at: [indexPath], with: .automatic)
        delegate?.shopViewController(productToRemoveFromCart: productTuple.0)
        
        
        // TODO: verificar si llega a cero, eliminar toda la celda.
    }
}


