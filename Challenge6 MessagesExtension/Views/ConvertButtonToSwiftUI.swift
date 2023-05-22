//
//  ConvertButtonToSwiftUI.swift
//  Challenge6 MessagesExtension
//
//  Created by Nick Gordon on 5/12/23.
//

import Foundation
import SwiftUI

struct UIButtonWrapper: UIViewRepresentable {
    typealias UIViewType = UIButton

    var title: String
    var action: () -> Void

    func makeUIView(context: Context) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.addTarget(context.coordinator, action: #selector(Coordinator.buttonTapped), for: .touchUpInside)
        return button
    }

    func updateUIView(_ uiView: UIButton, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(action: action)
    }

    class Coordinator {
        var action: () -> Void

        init(action: @escaping () -> Void) {
            self.action = action
        }

        @objc func buttonTapped() {
            action()
        }
    }
}
