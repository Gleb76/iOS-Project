//
//  PizzaController.swift
//  PizzaApp
//
//  Created by Глеб Клыга on 4.11.23.
//

import Foundation

class PizzaController {
    let pizzaModel: PizzaModel
    
    init() {
        pizzaModel = PizzaModel()
    }
    
    func addIngredient(_ ingredient: Ingredient) {
        pizzaModel.addIngredient(ingredient)
    }
    
    func removeIngredient(_ ingredient: Ingredient) {
        pizzaModel.removeIngredient(ingredient)
    }
    
    func printPizza() {
        pizzaModel.printPizza()
    }
}
