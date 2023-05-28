//
//  MenuItemViewModel.swift
//  FoodFest SwiftUI
//
//  Created by Jatin Patel on 5/24/23.
//

import Foundation

class MenuItemViewModel:ObservableObject {
    
    @Published var menuItemModel: MenuItemModel?
    @Published var viewState: ViewState = .loading
    
    func apiGetMenuItem(query:String) {
        self.viewState = .loading
        APIServices.shared.callCategoryMenu(inlineQuery: query) { response in
            if let response = response {
                print(response)
                self.menuItemModel = response
                self.viewState = .dataLoaded
            }
        }
    failure: { error in
        print(error)
        self.viewState = .error(message: error.description)
    }
    }
}
