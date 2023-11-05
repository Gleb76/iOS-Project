//
//  PizzaInfoViewController.swift
//  PizzaApp
//
//  Created by Глеб Клыга on 4.11.23.
//

import UIKit

final class PizzaInfoViewController: UIViewController {
    var pizza: Pizza?
    
    @IBOutlet weak var pizzaNameLabel: UILabel!
    @IBOutlet weak var pizzaImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let pizza = pizza {
            pizzaNameLabel.text = pizza.name
            pizzaImageView.image = UIImage(named: pizza.imageName)
        }
    }
    
}
