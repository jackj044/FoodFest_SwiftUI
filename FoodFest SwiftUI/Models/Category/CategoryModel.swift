//
//  CategoryModel.swift
//  FoodFest SwiftUI
//
//  Created by Jatin Patel on 5/24/23.
//
//   let categoryModel = try? JSONDecoder().decode(CategoryModel.self, from: jsonData)

import Foundation

// MARK: - CategoryModel
struct CategoryModel:Codable, Identifiable {
    var id: String? = UUID().uuidString
    let categories: [Category]?
}

// MARK: - Category
struct Category: Codable, Identifiable {
    //    var id: String? = UUID().uuidString
    let idCategory, strCategory: String?
    let strCategoryThumb: String?
    let strCategoryDescription: String?
    var id: String? {
        idCategory
    }
}
