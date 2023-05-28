//
//  MenuItemDetailViewModel.swift
//  FoodFest SwiftUI
//
//  Created by Jatin Patel on 5/27/23.
//

import Foundation

class MenuItemDetailViewModel:ObservableObject {
    
    @Published var menuItemDetailModel: MenuItemDetailModel?
    @Published var arrIngredient : [[String:String]] = []
    @Published var viewState: ViewState = .loading
    
    
    func apiGetMenuItemDetail(query:String) {
        self.viewState = .loading
        APIServices.shared.callMenuItemDetail(inlineQuery: query) { response in
            
            if let response = response {
                self.menuItemDetailModel = response
                self.fetchKeyVal(menuItemDetailModel: response)
                self.viewState = .dataLoaded
            }
        }
    failure: { error in
        self.viewState = .error(message: error.description)
    }
    }
    
    
    func fetchKeyVal(menuItemDetailModel: MenuItemDetailModel){
        
        let keys = menuItemDetailModel.meals?.first!.compactMapValues{ $0 }
        
        let filterArr = keys?.filter({ val in
            val.value != "" && val.value != " "
        })
        
        
        var newDictionaryKeys = [String: String]()
        var newDictionaryValue = [String: String]()
        
        
        // STORING ALL strIngredient VALUES IN newDictionaryKeys
        
        for (key, value) in filterArr! {
            
            if key.contains("strIngredient") && !value.isEmpty && value != " " {
                newDictionaryKeys[key] = value
            }
        }
        
        // STORING ALL strMeasure VALUES IN newDictionaryValue
        
        for (key, value) in filterArr! {
            
            if key.contains("strMeasure")  && !value.isEmpty && value != " " {
                newDictionaryValue[key] = value
            }
            
        }
        
        //        COMBINE VALUES OF strIngredient & strMeasure FROM newDictionaryKeys & newDictionaryValue
        
        for i in 0..<newDictionaryKeys.keys.count {
            var newDictionaryFinal = [String: String]()
            newDictionaryFinal[newDictionaryKeys["strIngredient\(i+1)"] ?? ""] = newDictionaryValue["strMeasure\(i+1)"]
            arrIngredient.append(newDictionaryFinal)
        }
        
    }
    
}
