//
//  PizzaTableViewController.swift
//  PizzaApp
//
//  Created by Глеб Клыга on 4.11.23.
//

import UIKit


final class PizzaTableViewController: UITableViewController {
    var ingredients: [Ingredient] = []
    var selectedIngredients: [Ingredient] = []
    var pizzaController: PizzaController!
    let finishButton = UIBarButtonItem(title: "Готово", style: .plain, target: PizzaTableViewController.self, action: #selector(finishButtonTapped))
    
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPizzaInfoSegue" {
            if let pizzaInfoViewController = segue.destination as? PizzaInfoViewController, let pizza = sender as? Pizza {
                pizzaInfoViewController.pizza = pizza
            }
        }
    }
    
    // MARK: - Helper methods
    
    func updateCellAccessory(for indexPath: IndexPath, isSelected: Bool) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = isSelected ? .checkmark : .none
    }
    
    // MARK: - Actions
    
    @objc func finishButtonTapped() {
        guard !selectedIngredients.isEmpty else {
            let alertController = UIAlertController(title: "Ошибка", message: "Выберите хотя бы один ингредиент", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        var selectedIngredientNames: [String] = []
        for ingredient in selectedIngredients {
            selectedIngredientNames.append(ingredient.name)
        }
        
        let pizza = createPizzaFromIngredients(selectedIngredientNames)
        
        if let pizza = pizza {
            performSegue(withIdentifier: "ShowPizzaInfoSegue", sender: pizza)
        } else {
            let alertController = UIAlertController(title: "Ошибка", message: "Не удалось создать пиццу с выбранными ингредиентами", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    func createPizzaFromIngredients(_ ingredientNames: [String]) -> Pizza? {
        if ingredientNames.contains("Помидоры") && ingredientNames.contains("Сыр") {
            return Pizza(name: "Маргарита", imageName: "margherita", ingredients: ingredientNames)
        } else if ingredientNames.contains("Грибы") && ingredientNames.contains("Сыр") {
            return Pizza(name: "Грибная", imageName: "mushroom", ingredients: ingredientNames)
        }
        
        return nil
    }
}
