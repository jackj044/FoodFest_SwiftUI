//
//  CategoryViewModel.swift
//  FoodFest SwiftUI
//
//  Created by Jatin Patel on 5/24/23.
//

import Foundation
import SwiftUI



class CategoryViewModel: ObservableObject {
    
    @Published var categoryModel: CategoryModel?
    @Published var viewState: ViewState = .loading
    
    
    func getCategory() {
        self.viewState = .loading
        APIServices.shared.callCategory() { response in
            if let response = response {
                
                debugPrint(response)
                self.categoryModel = response
                
                self.viewState = .dataLoaded
            }
        }
    failure: { error in
        debugPrint(error)
        self.viewState = .error(message: error.description)
    }
    }
    
    
}
