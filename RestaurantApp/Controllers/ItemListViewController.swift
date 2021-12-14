//
//  ItemListViewController.swift
//  RestaurantApp
//
//  Created by Mohar on 13/12/21.
//

import UIKit

class ItemListViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var foodList = [FoodItem]()
    var selectedCuisine : Cuisine? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let cuisine = selectedCuisine {
            self.title = cuisine.title
        }
        
        self.tableView.reloadData()
    }

}


extension ItemListViewController : UITableViewDelegate , UITableViewDataSource {
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : ItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HomeItemTableCellIdentifier", for: indexPath) as! ItemTableViewCell
        cell.bgCardView.makeCard()
        let foodItem = foodList[indexPath.row]
        cell.setupCellfor(foodItem: foodItem)
        return cell
        
        
    }
            
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 150
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    

}
