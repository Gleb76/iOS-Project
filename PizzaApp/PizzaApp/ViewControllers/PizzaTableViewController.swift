//
//  PizzaTableViewController.swift
//  PizzaApp
//
//  Created by Глеб Клыга on 4.11.23.
//

import UIKit

class PizzaTableViewController: UITableViewController {
    var ingredients: [Ingredient] = []
    var selectedIngredients: [Ingredient] = []
    var pizzaController: PizzaController!
    let finishButton = UIBarButtonItem(title: "Finish", style: .plain, target: self, action: #selector(finishButtonTapped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredients = [
            Ingredient(name: "Помидоры"),
            Ingredient(name: "Сыр"),
            Ingredient(name: "Грибы"),
            Ingredient(name: "Перец"),
            Ingredient(name: "Лук"),
            Ingredient(name: "Оливки"),
            Ingredient(name: "Пепперони"),
            Ingredient(name: "Ветчина"),
            Ingredient(name: "Ананасы"),
            Ingredient(name: "Бекон")
        ]
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.allowsMultipleSelection = true
        
        // Создание экземпляра контроллера пиццы
        pizzaController = PizzaController()
        
        finishButton.target = self
        finishButton.action = #selector(finishButtonTapped)
        navigationItem.rightBarButtonItem = finishButton
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let ingredient = ingredients[indexPath.row]
        cell.textLabel?.text = ingredient.name
        
        if selectedIngredients.contains(where: { $0 == ingredient }) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ingredient = ingredients[indexPath.row]
        selectedIngredients.append(ingredient)
        pizzaController.addIngredient(ingredient)
        updateCellAccessory(for: indexPath, isSelected: true)
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let ingredient = ingredients[indexPath.row]
        if let index = selectedIngredients.firstIndex(of: ingredient) {
            selectedIngredients.remove(at: index)
            pizzaController.removeIngredient(ingredient)
            updateCellAccessory(for: indexPath, isSelected: false)
        }
    }
    
    // MARK: - Helper methods
    
    func updateCellAccessory(for indexPath: IndexPath, isSelected: Bool) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = isSelected ? .checkmark : .none
    }
    
    // MARK: - Actions
    
    @objc func finishButtonTapped() {
           pizzaController.printPizza()
       }
}
