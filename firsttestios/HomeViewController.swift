//
//  ViewController.swift
//  firsttestios
//
//  Created by Anibal Francisco Correa on 27/6/17.
//  Copyright © 2017 Anibal Francisco Correa. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var productsArray: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func showProducts() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        if let productViewController = storyboard.instantiateViewController(withIdentifier:
            "productsViewController") as? ProductViewController {
            
            productViewController.setProducts(loadProducts())
            navigationController?.pushViewController(productViewController, animated: true)
            
        }
    }
    
    private func loadProducts() -> [Product] {
        //"Oreos", "Empanadas", "Galletitas", "Yerba Mate", "Cerveza Heineken"
        
        let arroz = Product(name: "Arroz Amanda", description: "Arroz Amanda", price: 3.50, image: UIImage(named: "arrozamanda"), stock: 10)
        let detergente = Product(name: "Detergente", description: "Detergente", price: 7, image: UIImage(named: "detergente"), stock: 20)
        let empanadas = Product(name: "Empanadas", description: "Unidad de Empanada", price: 5.60, image: UIImage(named: "empanadas"), stock: 15)
        let galletitas = Product(name: "Galletita Diversion", description: "Paquete de Galletita", price: 7.80, image: UIImage(named:"galletitasdiversion"), stock: 20)
        let cerveza = Product(name: "Cerveza Heineken", description: "Cerveza 3/4 Heineken ", price: 3.50, image: UIImage(named:"heineken"), stock: 15)
        let jabonpolvo = Product(name: "Jabon en Polvo", description: "Paquete de Jabon en Polvo ", price: 3.50, image: UIImage(named:"jabonpolvo"), stock: 15)
        let yerbamate = Product(name: "Yerba Mate", description: "Paquete de Yerba Mate", price: 3.50, image: UIImage(named:"yerbamate"), stock: 15)
        
        
        productsArray = [arroz, detergente, empanadas, galletitas, cerveza, jabonpolvo, yerbamate]
        
        return productsArray
        
    }
    
    
    @IBAction func tappedButtonSeeProducts(_ sender: UIButton) {
        showProducts()
    }
    
    
    


}

