//
//  FastFoodTableViewController.swift
//  Lab Exercise 1
//
//  Created by student on 2/22/23.
//

import UIKit

struct Restaurant {
    var imageName: String
    var name: String
    var isHidden: Bool = false
    var isHorizontal: Bool = false
}

class ProgrammaticViewController: UITableViewController {
    private static let programmaticFastFoodCellReuseIdentifier = "&"
    
    var restaurants = [
        Restaurant(imageName: "jollibeeImage", name: "Jolibee"),
        Restaurant(imageName: "mcdoPic", name: "McDonald's"),
        Restaurant(imageName: "Wendys", name: "Wendy's"),
        Restaurant(imageName: "tacoBelll", name: "Taco Bell"),
        Restaurant(imageName: "kFc", name: "KFC"),
        Restaurant(imageName: "burgerKing", name: "Burger King"),
    ]
   
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(
            FastFoodTableViewCell.self,
            forCellReuseIdentifier: ProgrammaticViewController.programmaticFastFoodCellReuseIdentifier
        )
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ProgrammaticViewController.programmaticFastFoodCellReuseIdentifier,
            for: indexPath
        ) as? FastFoodTableViewCell
        else { return UITableViewCell() }

        let food = restaurants[indexPath.row]
        cell.stackView.axis = food.isHorizontal ? .horizontal : .vertical
        cell.Label.isHidden = food.isHidden
        cell.Label.text = food.name
        cell.ImageView.image = UIImage(named: food.imageName)
        
        
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let food = restaurants[indexPath.row]
        goToClickViewController(food: food)
    }

    func goToClickViewController(food: Restaurant) {

        let storyboard = UIStoryboard(name: "ClickViewController", bundle: nil)

        guard let detailsViewController = storyboard.instantiateViewController(withIdentifier: "detailsVCIdentifier") as? ClickViewController else { return }

        detailsViewController.food = food

        
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
}
