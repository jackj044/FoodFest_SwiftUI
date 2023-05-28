//
//  MenuItemDetail.swift
//  FoodFest SwiftUI
//
//  Created by Jatin Patel on 5/27/23.
//

import SwiftUI
import Kingfisher
import QGrid


struct MenuItemDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var menuItemDetailViewModel = MenuItemDetailViewModel()
    
    var menuItem : Meal?
    
    
    var grid : [GridItem]
    
    
    init(menuItem:Meal){
        self.menuItem = menuItem
        grid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible())]
    }
    
    var body: some View {
        VStack {
            
            switch menuItemDetailViewModel.viewState {
            case .loading:
                ProgressView("Loading data…")
            case .dataLoaded:
                if let data = menuItemDetailViewModel.menuItemDetailModel?.meals?.first{
                    ScrollView{
                        VStack(spacing:20) {
                            KFImage.url(URL(string: (data["strMealThumb"] ?? "") ?? ""))
                                .resizable()
                                .placeholder({
                                    Image("logo")
                                        .resizable()
                                        .aspectRatio(1, contentMode: .fit)
                                })
                                .loadDiskFileSynchronously()
                                .cacheMemoryOnly()
                                .fade(duration: 0.25)
                                .progressViewStyle(.circular)
                                .cornerRadius(10)
                                .aspectRatio(1, contentMode: .fit)
                            Spacer()
                            Text("Instructions")
                                .font(.system(size: 20,weight: .bold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text((data["strInstructions"] ?? "") ?? "")
                                .font(.system(size: 13,weight: .medium))
                            
                            Text("Ingredients")
                                .font(.system(size: 20,weight: .bold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            IngredientView(menuItemDetailViewModel: menuItemDetailViewModel)
                        }
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
        .padding(10)
        .navigationBarColor(UIColor(Color(hex: "3CC3DF")))
        .appBar(title: menuItem?.strMeal ?? "Item Detail") {
            self.presentationMode.wrappedValue.dismiss()
        } trailingButtonAction: {
            
        }
        .onAppear(perform: {
            debugPrint("============================")
            debugPrint("MENU ITEM DETAIL onAppear CALL")
            menuItemDetailViewModel.apiGetMenuItemDetail(query: menuItem?.idMeal ?? "")
        })
        
    }
}

//struct MenuItemDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuItemDetailView(menuItem: Meal(from: <#Decoder#>))
//    }
//}
