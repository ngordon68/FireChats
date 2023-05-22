//
//  LottieSetUpView.swift
//  Challenge6 MessagesExtension
//
//  Created by Nick Gordon on 5/6/23.
//

import Foundation
import Lottie
import SwiftUI


//converts Lottie from UIKit to SwiftUI to use
//Lottie animation by default is for UIKit

struct LottieView: UIViewRepresentable {
    
    typealias UIViewType = UIView
    var animationName: String
    var loopMode: LottieLoopMode = .loop
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        let animationView = LottieAnimationView(name: animationName)
        //animationView.animation = animation
        animationView.loopMode = loopMode
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        animationView.play()
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        // Do nothing
    }
}
