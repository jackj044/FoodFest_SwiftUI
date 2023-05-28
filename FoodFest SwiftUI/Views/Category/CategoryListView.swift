//
//  CategoryListView.swift
//  FoodFest SwiftUI
//
//  Created by Jatin Patel on 5/23/23.
//

import SwiftUI
import QGrid
import UIKit

struct CategoryListView: View {
    
    @ObservedObject var categoryViewModel =  CategoryViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                switch categoryViewModel.viewState {
                case .loading:
                    ProgressView("Loading data…")
                case .dataLoaded:
                    if let data = categoryViewModel.categoryModel, let cats = data.categories {
                        
                        QGrid(cats.sorted(by: {$0.strCategory! < $1.strCategory!}),
                              columns: 2,
                              columnsInLandscape: 4,
                              vSpacing: 10,
                              hSpacing: 10,
                              vPadding: 10,
                              hPadding: 10
                        ) { data in
                            
                            
                            NavigationLink(destination:  MenuItemListView(categoryName: data.strCategory)) {
                                CategoryGridCell(imageUrl: data.strCategoryThumb ?? "",name: data.strCategory)
                            }
                            .foregroundColor(Color.black)
                        }
                        
                    }
                case .error(let errorMsg):
                    Text(errorMsg)
                        .multilineTextAlignment(.center)
                default:
                    Text("Something Went Wrong")
                        .multilineTextAlignment(.center)
                }
                
            }
            .appBar(title: "Categories",isBackEnable: false) {
                debugPrint("Back Tapped")
            } trailingButtonAction: {
                
            }
            .navigationBarColor(UIColor(Color(hex: "3CC3DF")))
        }
        .refreshable {
            categoryViewModel.getCategory()
        }
        .onAppear {
            categoryViewModel.getCategory()
        }
        
    }
    
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView(categoryViewModel: CategoryViewModel())
    }
}


