//
//  CardTotalTableViewCell.swift
//  RestaurantApp
//
//  Created by Mohar on 14/12/21.
//

import UIKit

class CardTotalTableViewCell: UITableViewCell {

    
    @IBOutlet weak var totalPricelbl: UILabel!
    @IBOutlet weak var totalPriceTitlelbl: UILabel!
    @IBOutlet weak var sgstPricelbl: UILabel!
    @IBOutlet weak var sgstPriceTitlelbl: UILabel!
    @IBOutlet weak var cgstPricelbl: UILabel!
    @IBOutlet weak var cgstPriceTitlelbl: UILabel!
    @IBOutlet weak var grandTotalPricelbl: UILabel!
    @IBOutlet weak var grandTotalPriceTitlelbl: UILabel!
    
    @IBOutlet weak var bgCardView: CardView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        totalPriceTitlelbl.text = "Total".localize() + " : "
        sgstPriceTitlelbl.text = "SGST".localize() + " (2.5%) : "
        cgstPriceTitlelbl.text = "CGST".localize() + " (2.5%) : "
        grandTotalPriceTitlelbl.text = "Grand Total".localize() + " : "
        bgCardView.makeCard()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
