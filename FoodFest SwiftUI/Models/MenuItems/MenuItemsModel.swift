//
//  MenuItemsModel.swift
//  FoodFest SwiftUI
//
//  Created by Jatin Patel on 5/24/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let categoryModel = try? JSONDecoder().decode(CategoryModel.self, from: jsonData)

import Foundation

// MARK: - CategoryModel
struct MenuItemModel: Codable,Identifiable {
    var id: String? = UUID().uuidString
    let meals: [Meal]?
}

// MARK: - Meal
struct Meal: Codable,Identifiable {
    let strMeal: String?
    let strMealThumb: String?
    let idMeal: String?
    
    var id: String? {
        idMeal
    }
}
