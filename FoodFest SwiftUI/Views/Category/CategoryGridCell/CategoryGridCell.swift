//
//  CategoryGridCell.swift
//  FoodFest SwiftUI
//
//  Created by Jatin Patel on 5/24/23.
//

import SwiftUI
import Kingfisher

struct CategoryGridCell:View {
    
    var imageUrl:String?
    var name: String?
    
    var body: some View {
        VStack {
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
                .cornerRadius(20)
                .shadow(radius: 20)
                .aspectRatio(contentMode: .fit)
            
            Text(name ?? "").lineLimit(1)
        }
    }
}
