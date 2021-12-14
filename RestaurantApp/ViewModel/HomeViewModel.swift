//
//  HomeViewModel.swift
//  RestaurantApp
//
//  Created by Mohar on 13/12/21.
//

import UIKit

class HomeViewModel: NSObject {

    func initializeData() {
        
    }
    
    func initializeData(with completion: (() -> Void)) {
        createCuisineOne()
        createCuisineTwo()
        createCuisineThree()
        CoreDataManager.sharedInstance.savePrivateContext()
//           DispatchQueue.async {
               completion()
//           }
       }
    
    func createCuisineOne()  {
        if CoreDataManager.sharedInstance.getCoisineForID(cuisineID: 1) != nil {
            return // return if Cuisine already saved
        }
        let cuisine1 = CoreDataManager.sharedInstance.insertNewModel(name: "Cuisine") as! Cuisine
        cuisine1.title = "North Indian"
        cuisine1.image = "north-Indian"
        cuisine1.details = "North Indian Cuisine"
        cuisine1.cuisineID = 1
        
        let foodItem1 = CoreDataManager.sharedInstance.insertNewModel(name: "FoodItem") as! FoodItem
        foodItem1.title = "Cottage cheese with Peas in Indian Gravy"
        foodItem1.image = "cottage-cheese-peas-indian-gravy"
        foodItem1.detail = "Cottage cheese with Peas in Indian Gravy"
        foodItem1.price = 250.0
        foodItem1.itemID = 11
        cuisine1.addToItems(foodItem1)
        
        let foodItem2 = CoreDataManager.sharedInstance.insertNewModel(name: "FoodItem") as! FoodItem
        foodItem2.title = "Boneless Butter Chicken and Chapati served for dinner"
        foodItem2.image = "Boneless-Butter-Chapati"
        foodItem2.detail = "Boneless Butter Chicken and Chapati served for dinner"
        foodItem2.price = 175.0
        foodItem2.itemID = 12
        cuisine1.addToItems(foodItem2)
        
        let foodItem3 = CoreDataManager.sharedInstance.insertNewModel(name: "FoodItem") as! FoodItem
        foodItem3.title = "food item 1"
        foodItem3.image = "foodItem1"
        foodItem3.detail = "food item 1"
        foodItem3.price = 115.0
        foodItem3.itemID = 13
        cuisine1.addToItems(foodItem3)
        
        let foodItem4 = CoreDataManager.sharedInstance.insertNewModel(name: "FoodItem") as! FoodItem
        foodItem4.title = "food item 2"
        foodItem4.image = "foodItem2"
        foodItem4.detail = "food item 2"
        foodItem4.price = 155.0
        foodItem4.itemID = 14
        cuisine1.addToItems(foodItem4)
        
        
    }
    
    func createCuisineTwo()  {
        if CoreDataManager.sharedInstance.getCoisineForID(cuisineID: 2) != nil {
            return // return if Cuisine already saved
        }
        let cuisine2 = CoreDataManager.sharedInstance.insertNewModel(name: "Cuisine") as! Cuisine
        cuisine2.title = "South Indian"
        cuisine2.image = "south-indian"
        cuisine2.details = "South Indian Cuisine"
        cuisine2.cuisineID = 2
        
        let foodItem1 = CoreDataManager.sharedInstance.insertNewModel(name: "FoodItem") as! FoodItem
        foodItem1.title = "Idly sambar"
        foodItem1.image = "idly-sambar"
        foodItem1.detail = "Idly sambar"
        foodItem1.price = 250.0
        foodItem1.itemID = 21
        cuisine2.addToItems(foodItem1)
        
        let foodItem2 = CoreDataManager.sharedInstance.insertNewModel(name: "FoodItem") as! FoodItem
        foodItem2.title = "Masala Dosa"
        foodItem2.image = "masala-dosa"
        foodItem2.detail = "Masala Dosa"
        foodItem2.price = 175.0
        foodItem2.itemID = 22
        cuisine2.addToItems(foodItem2)
        
        let foodItem3 = CoreDataManager.sharedInstance.insertNewModel(name: "FoodItem") as! FoodItem
        foodItem3.title = "Sambar Vada Indian Dish"
        foodItem3.image = "sambar-Vada"
        foodItem3.detail = "Sambar Vada Indian Dish"
        foodItem3.price = 115.0
        foodItem3.itemID = 23
        cuisine2.addToItems(foodItem3)
        
        let foodItem4 = CoreDataManager.sharedInstance.insertNewModel(name: "FoodItem") as! FoodItem
        foodItem4.title = "Rava Dosa"
        foodItem4.image = "rava-dosa"
        foodItem4.detail = "Rava Dosa"
        foodItem4.price = 155.0
        foodItem4.itemID = 24
        cuisine2.addToItems(foodItem4)
        
        
    }
    
    func createCuisineThree()  {
        if CoreDataManager.sharedInstance.getCoisineForID(cuisineID: 3) != nil {
            return // return if Cuisine already saved
        }
        let cuisine3 = CoreDataManager.sharedInstance.insertNewModel(name: "Cuisine") as! Cuisine
        cuisine3.title = "dessert sweet Cuisine"
        cuisine3.image = "dessert-sweet"
        cuisine3.details = "dessert sweet Cuisine"
        cuisine3.cuisineID = 3
        
        let foodItem1 = CoreDataManager.sharedInstance.insertNewModel(name: "FoodItem") as! FoodItem
        foodItem1.title = "Apple Pie"
        foodItem1.image = "apple-pie-ice-cream"
        foodItem1.detail = "Apple Pie"
        foodItem1.price = 250.0
        foodItem1.itemID = 31
        cuisine3.addToItems(foodItem1)
        
        let foodItem2 = CoreDataManager.sharedInstance.insertNewModel(name: "FoodItem") as! FoodItem
        foodItem2.title = "2. Almond Malai Kulfi"
        foodItem2.image = "almond-kulfi"
        foodItem2.detail = "2. Almond Malai Kulfi"
        foodItem2.price = 175.0
        foodItem2.itemID = 32
        cuisine3.addToItems(foodItem2)
        
        let foodItem3 = CoreDataManager.sharedInstance.insertNewModel(name: "FoodItem") as! FoodItem
        foodItem3.title = "Pistachio Phirni"
        foodItem3.image = "pistachio-phirni"
        foodItem3.detail = "Pistachio Phirni"
        foodItem3.price = 115.0
        foodItem3.itemID = 33
        cuisine3.addToItems(foodItem3)
        
        let foodItem4 = CoreDataManager.sharedInstance.insertNewModel(name: "FoodItem") as! FoodItem
        foodItem4.title = "Fudgy Chewy Brownies"
        foodItem4.image = "chocolate-brownies"
        foodItem4.detail = "Fudgy Chewy Brownies"
        foodItem4.price = 155.0
        foodItem4.itemID = 34
        cuisine3.addToItems(foodItem4)
        
        
    }
}
