//
//  AddtoCartView.swift
//  RestaurantApp
//
//  Created by Mohar on 07/12/21.
//

import UIKit

protocol AddtoCartViewProtocol {
    func userClickOnAddToCard(currentCount : Int)
}

class AddtoCartView: UIView {

    

    var cardDelegate : AddtoCartViewProtocol?
    @IBOutlet weak var countLbl: UILabel!
    @IBOutlet weak var addFreshBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var removeBtn: UIButton!
    
    static var maxCount = 10

    private var currentCount = 0
    
    class func instanceFromNib() -> AddtoCartView {
        let view  = UINib(nibName: "AddtoCartView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! AddtoCartView
        view.refreshCartView()
        return view
       }
    
    func setDelegate(delegate :AddtoCartViewProtocol)  {
        self.cardDelegate = delegate
    }

    @IBAction func addBtnAction(_ sender: Any)  {
        if currentCount < AddtoCartView.maxCount {
            currentCount+=1
        }
        refreshCartView()
        if let delegate = cardDelegate {
            delegate.userClickOnAddToCard(currentCount: currentCount)
        }
    }
    
    @IBAction func removeBtnAction(_ sender: Any)  {
        if currentCount > 0 {
            currentCount-=1
        }
        refreshCartView()
        if let delegate = cardDelegate {
            delegate.userClickOnAddToCard(currentCount: currentCount)
        }
    }
    
    func setCurrentCount(count : Int)  {
        currentCount = count
        refreshCartView()
    }
    
    func refreshCartView() {
        if currentCount == 0 {
            addFreshBtn.isHidden = false
            removeBtn.isHidden = true
            addBtn.isHidden = true
            countLbl.isHidden = true
        } else {
            addFreshBtn.isHidden = true
            removeBtn.isHidden = false
            addBtn.isHidden = false
            countLbl.isHidden = false
        }
        countLbl.text = "\(currentCount)"
        
    }
}
