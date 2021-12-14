//
//  Localization.swift
//  RestaurantApp
//
//  Created by Mohar on 14/12/21.
//

import Foundation

func localize(_ string: String) -> String {
    return NSLocalizedString(string, comment: "")
}

extension String {
    func localize() -> String {
        
        var currentLanguage = "en" //Localization.currentAppleLanguage()
        if let language = UserDefaults.standard.value(forKey: "UserLanguage") as? String {
            currentLanguage = language
        }
        var bundle = Bundle();
        if let _path = Bundle.main.path(forResource: currentLanguage, ofType: "lproj") {
            bundle = Bundle(path: _path)!
        } else {
            let _path = Bundle.main.path(forResource: "Base", ofType: "lproj")!
            bundle = Bundle(path: _path)!
        }

        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
}
