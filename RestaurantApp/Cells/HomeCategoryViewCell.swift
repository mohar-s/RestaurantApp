//
//  HomeCategoryViewCell.swift
//  RestaurantApp
//
//  Created by Mohar on 07/12/21.
//

import UIKit

class HomeCategoryViewCell: UITableViewCell {

    var delegate : HomeCategorySelectionProtocol?
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
//    var dataSource = ["item 0", "item 1", "item 2"]
    var cuisineList = [Cuisine]()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func refreshCategoryCell(cuisineList: [Cuisine]) {
        self.cuisineList = cuisineList
        collectionView.reloadData()
    }

}
extension HomeCategoryViewCell : UICollectionViewDelegate , UICollectionViewDataSource   {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cuisineList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let index = indexPath.row % self.cuisineList.count
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCategoryItemCollectionCellIdentifier", for: indexPath)
            as! HomeCategoryItemCollectionCell
        
        let cuisine  = cuisineList[indexPath.row]
        cell.setupCellfor(cuisine: cuisine)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.userSelctedCategoryAtIndex(index: indexPath.row)
        }
        
//        collectionView.reloadData()

    }
    
}

extension HomeCategoryViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 180, height: 130)
        
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) //.zero
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

