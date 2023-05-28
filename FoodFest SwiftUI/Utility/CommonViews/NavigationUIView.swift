//
//  NavigationUIView.swift
//  NC Customer
//
//  Created by Jatin Patel on 5/9/23.
//

import SwiftUI

extension View {
    
    /// CommonAppBar
    public func appBar(title: String,isBackEnable:Bool? = true,isTrailingEnable:Bool? = false, leadingButtonAction: @escaping() -> Void, trailingButtonAction: @escaping() -> Void ) -> some View {
        self
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
        
        
            .navigationBarItems(leading: Button(action: {
                leadingButtonAction()
            }) {
                Image("back")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: isBackEnable! ? 30 : 0, height: isBackEnable! ? 30 : 0)
                    .tint(Color.white)
                    .foregroundColor(Color.white)
                    .accentColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
            })
        
            .navigationBarItems(trailing: Button(action: {
                trailingButtonAction()
            }) {
                Image("sort")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: isTrailingEnable! ? 30 : 0, height: isTrailingEnable! ? 25 : 0)
                    .tint(Color.white)
                    .foregroundColor(Color.white)
                    .accentColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
            })
    }
}



