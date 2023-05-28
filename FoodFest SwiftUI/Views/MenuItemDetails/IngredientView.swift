//
//  IngredientView.swift
//  FoodFest SwiftUI
//
//  Created by Jatin Patel on 5/27/23.
//

import SwiftUI

struct IngredientView: View {
    
    var menuItemDetailViewModel = MenuItemDetailViewModel()
    
    var body: some View {
        
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
            ForEach(0..<menuItemDetailViewModel.arrIngredient.count , id: \.self) { index in
                ZStack{
                    VStack{
                        
                        Text(menuItemDetailViewModel.arrIngredient[index].keys.first ?? "")
                            .font(.system(size: 15,weight: .bold))
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                        Text(menuItemDetailViewModel.arrIngredient[index].values.first ?? "" )
                            .fixedSize(horizontal: false, vertical: true)
                        
                    }
                    .padding(20)
                }
                .frame(width: (UIScreen.main.bounds.width / 2) - 30 , height: 80)
                .background(Color(hex: "F8F8F8"))
                .cornerRadius(10)
            }
        }
        
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView()
    }
}
