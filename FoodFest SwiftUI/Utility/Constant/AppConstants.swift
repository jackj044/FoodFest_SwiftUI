//
//  AppConstants.swift
//  NC Customer
//
//  Created by Jatin Patel on 5/22/23.
//

import Foundation


struct AppFonts {
    static let poppinsRegular = "Poppins-Regular"
    static let poppinsBold = "Poppins-Bold"
    static let poppinsLight = "Poppins-Light"
    static let poppinsMedium = "Poppins-Medium"
    static let poppinsSemiBold = "Poppins-SemiBold"
}

struct AppConstant {
    static let onBoardingTitle = "Choose"
    static let onBoardingTitle2 = "Your Language"
    
    static let btnSelectToContinue = "Select to Continue"
    
    
}
struct APIConstants {
    static let serverURL: String = "https://www.themealdb.com/api/json/v1/1/"
    
// API END POINTS
    
    static let apiCategory: String = "categories.php"
    static let apiCategoryMenu = "filter.php?c="
    static let apiMenuItemDetail = "lookup.php?i="
    
}
//https://themealdb.com/api/json/v1/1/filter.php?c=Dessert
