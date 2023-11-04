//
//  PizzaModel.swift
//  PizzaApp
//
//  Created by Глеб Клыга on 4.11.23.
//

import Foundation

class Ingredient: Equatable {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    static func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
        return lhs.name == rhs.name
    }
}

class PizzaModel {
    var ingredients: [Ingredient] = []
    
    func addIngredient(_ ingredient: Ingredient) {
        ingredients.append(ingredient)
    }
    
    func removeIngredient(_ ingredient: Ingredient) {
        if let index = ingredients.firstIndex(where: { $0.name == ingredient.name }) {
            ingredients.remove(at: index)
        }
    }
    
    func clearIngredients() {
        ingredients.removeAll()
    }
    
    func printPizza() {
        print("Собрана пицца с ингредиентами:")
        for ingredient in ingredients {
            print("- \(ingredient.name)")
        }
    }
}
