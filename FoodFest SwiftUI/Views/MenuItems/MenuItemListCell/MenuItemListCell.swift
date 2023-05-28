//
//  MenuItemListCell.swift
//  FoodFest SwiftUI
//
//  Created by Jatin Patel on 5/24/23.
//

import SwiftUI
import Kingfisher

struct MenuItemListCell: View {
    
    var imageUrl:String?
    var name: String?
    
    var body: some View {
        HStack{
            
            
            KFImage.url(URL(string: imageUrl ?? ""))
                .resizable()
                .placeholder({
                    Image("logo")
                        .resizable()
                        .frame(width: 80,height: 80)
                })
                      .loadDiskFileSynchronously()
                      .cacheMemoryOnly()
                      .fade(duration: 0.25)
                      .progressViewStyle(.circular)
                      .frame(width: 80,height: 80)
                      .cornerRadius(20)
                      .shadow(radius: 20)
                      .padding(10)
            
            Text(name ?? "").lineLimit(3)
        }
    }
}

struct MenuItemListCell_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemListCell()
    }
}
