//
//  PizzaController.swift
//  PizzaApp
//
//  Created by Глеб Клыга on 4.11.23.
//

import Foundation

struct Pizza {
    let name: String
    let imageName: String
    let ingredients: [String]
}

final class PizzaController {
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
    
    func getPizzas() -> [Pizza] {
        let pizzas: [Pizza] = [
            Pizza(name: "Маргарита", imageName: "margherita", ingredients: ["Помидоры","Сыр"]),
            Pizza(name: "Грибная", imageName: "mushroom", ingredients: ["Грибы","Сыр"])
        ]
        return pizzas
    }
    
    func printPizza() {
        pizzaModel.printPizza()
    }
}
