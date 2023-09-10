//
//  SendOutView.swift
//  Challenge6 MessagesExtension
//
//  Created by Nick Gordon on 5/12/23.
//

import SwiftUI

struct SendOutView: View {
        
    var prompt:String
    
    
    var body: some View {
        
        let gradient = Gradient(colors: [.fireChatsYellow, .fireChatsPurple])

            Rectangle()
                .withFireChatFormatting()
                .foregroundStyle(LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
                .overlay (
                    
                    ZStack {
                        Image("fire")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .opacity(0.2)
                        
                        Text(prompt)
                            .font(.custom("GrandeuxSerifPERSONALUSE-Regular", size: 20))
                            .padding(.horizontal)
    
                    }
                )
           }
}

