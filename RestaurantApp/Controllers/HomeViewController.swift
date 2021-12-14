//
//  HomeViewController.swift
//  RestaurantApp
//
//  Created by Mohar on 07/12/21.
//

import UIKit

protocol HomeCategorySelectionProtocol {
    func userSelctedCategoryAtIndex(index : Int)
}

class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    var rightBarBtn : UIBarButtonItem!
    
    var cuisineList = [Cuisine]()
    var famousFoodList = [FoodItem]()
    
    lazy var viewModel: HomeViewModel = {
        let viewModel = HomeViewModel()
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home".localize()
        self.tableView.sectionHeaderHeight = 60
        let headerCell = self.tableView.dequeueReusableCell(withIdentifier: "HomeResturantNameCellIdentifer") as! HomeHeaderViewCell
        headerCell.titleLbl.text = "Welcome on ABC Restaurant"
        self.tableView.tableHeaderView = headerCell
        
        self.viewModel.initializeData {
            cuisineList = CoreDataManager.sharedInstance.getAllCoisineList()
            famousFoodList = CoreDataManager.sharedInstance.getfamousFoodItemList()
            self.tableView.reloadData()
        }
        
        rightBarBtn = UIBarButtonItem(title: "Language".localize(), style: .done, target: self, action: #selector(addTapped))
        
        self.navigationItem.rightBarButtonItem = rightBarBtn
        
    }
    
    @objc func addTapped() {
        
        let alert = UIAlertController(title: "Change Language".localize(), message: "Please choose your Language".localize(), preferredStyle: .alert)
        let engAction = UIAlertAction(title: "English".localize(), style: .default) { UIAlertAction in
            print("English")
            UserDefaults.standard.setValue("en", forKey: "UserLanguage")
            self.refreshLanguageSelection()
        }
        alert.addAction(engAction)
        let hindiAction = UIAlertAction(title: "Hindi".localize(), style: .default) { UIAlertAction in
            print("hindAction")
            UserDefaults.standard.setValue("hi", forKey: "UserLanguage")
            self.refreshLanguageSelection()
        }
        alert.addAction(hindiAction)
        
        let okAction = UIAlertAction(title: "Cancel".localize(), style: .default, handler: nil)
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func refreshLanguageSelection()  {
        self.title = "Home".localize()
        rightBarBtn.title = "Language".localize()
        super.refreshCartInfo()
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

}


extension HomeViewController : UITableViewDelegate , UITableViewDataSource {
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = self.tableView.dequeueReusableCell(withIdentifier: "HomeTableSectionCellIdentifer") as! HomeHeaderViewCell
        switch section {
        case 0:
            headerCell.titleLbl.text = "What do you want to eat today?".localize()
        case 1:
            headerCell.titleLbl.text = "Popular Dish Today".localize()
        default:
            print("")
        }
        
        return headerCell
    }
 
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return famousFoodList.count > 3 ? 3 : famousFoodList.count
        default:
            print("")
        }
        return 0
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell : HomeCategoryViewCell = tableView.dequeueReusableCell(withIdentifier: "HomeCategoryViewCellIdentifier", for: indexPath) as! HomeCategoryViewCell
            cell.delegate = self
            cell.refreshCategoryCell(cuisineList: cuisineList)
            return cell
        case 1:
            let cell : ItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HomeItemTableCellIdentifier", for: indexPath) as! ItemTableViewCell
            let foodItem = famousFoodList[indexPath.row]
            cell.bgCardView.makeCard()
            cell.setupCellfor(foodItem: foodItem)
            return cell
        case 2:
            print("")
        case 3:
            print("")
        case 4:
            print("")
        default:
            print("Default")
        }
        
        return UITableViewCell()

    }
            
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 150
        case 1:
            return 150
        default:
            print("")
        }
        
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
    }
    
}

extension HomeViewController : HomeCategorySelectionProtocol{
    func userSelctedCategoryAtIndex(index: Int) {
        print("index \(index)")
        let itemListVC = self.storyboard!.instantiateViewController(withIdentifier: "ItemListViewController_SB_ID") as! ItemListViewController
        let selectedCuisine = cuisineList[index]
        if let items = selectedCuisine.items?.allObjects as? [FoodItem] {
            itemListVC.foodList = items
        }
        itemListVC.selectedCuisine = selectedCuisine
        self.navigationController?.pushViewController(itemListVC, animated: true)
    }
    
}


