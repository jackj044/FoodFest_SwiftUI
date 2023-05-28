//
//  SplashView.swift
//  FoodFest SwiftUI
//
//  Created by Jatin Patel on 5/23/23.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false
    
    
    var body: some View {
        ZStack {
            if isActive {
                VStack{
                    CategoryListView(categoryViewModel: CategoryViewModel())
                }
                
            }else {
                Image("logo")
            }
            
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

