//
//  CardViewModifiers.swift
//  FireChats MessagesExtension
//
//  Created by Nick Gordon on 7/30/23.
//

import Foundation
import SwiftUI

struct FireChatsCardModifiers: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(width: 300, height: 200)
            .cornerRadius(20)
            .shadow(color: .black, radius: 5, x: 0, y: 0)
            
    }
}

extension View {
    
    func withFireChatFormatting() -> some View {
        modifier(FireChatsCardModifiers())
        
    }
}

