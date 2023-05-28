//
//  AttributedLable.swift
//  NC Customer
//
//  Created by Jatin Patel on 5/22/23.
//

import SwiftUI

struct UIKLabel: UIViewRepresentable {

    typealias TheUIView = UILabel
    fileprivate var configuration = { (view: TheUIView) in }

    func makeUIView(context: UIViewRepresentableContext<Self>) -> TheUIView { TheUIView() }
    func updateUIView(_ uiView: TheUIView, context: UIViewRepresentableContext<Self>) {
        configuration(uiView)
    }
}
