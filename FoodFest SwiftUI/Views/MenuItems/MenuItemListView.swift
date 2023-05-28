//
//  MenuItemView.swift
//  FoodFest SwiftUI
//
//  Created by Jatin Patel on 5/24/23.
//

import SwiftUI

struct MenuItemListView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var  menuItemViewModel =  MenuItemViewModel()
    @State var isSorted = true
    var categoryName:String?
    
    var body: some View {
        
        VStack{
            
            
            switch menuItemViewModel.viewState {
            case .loading:
                ProgressView("Loading data…")
            case .dataLoaded:
                
                if let data = menuItemViewModel.menuItemModel?.meals {
                    List(data.sorted(by: isSorted ? {$0.strMeal! < $1.strMeal!} : {$0.strMeal! > $1.strMeal!})) { values in
                        
                        NavigationLink(destination:  MenuItemDetailView(menuItem: values)) {
                            MenuItemListCell(imageUrl: values.strMealThumb ?? "", name: values.strMeal ?? "")
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
        .navigationBarColor(UIColor(Color(hex: "3CC3DF")))
        .appBar(title: self.categoryName ?? "Menu",isTrailingEnable: true) {
            self.presentationMode.wrappedValue.dismiss()
        } trailingButtonAction: {
            self.isSorted = !isSorted
        }
        
        .onAppear(perform: {
            menuItemViewModel.apiGetMenuItem(query: categoryName ?? "")
        })
        
//        .refreshable {
//            menuItemViewModel.apiGetMenuItem(query: categoryName ?? "")
//        }
    }
    
    
}

struct MenuItemListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemListView()
    }
}
