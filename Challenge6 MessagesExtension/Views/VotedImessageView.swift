//
//  VotedImessageView.swift
//  FireChats MessagesExtension
//
//  Created by Nick Gordon on 7/31/23.
//

import SwiftUI

struct VotedImessageView: View {
    
    @ObservedObject var fireChat:FireChatsViewModel
    var prompt:String
    var isHotTapped:Bool
 
    
    var body: some View {
        
        let gradient = isHotTapped ? Gradient(colors: [.fireChatsYellow, .fireChatsOrange, .fireChatsRed, .fireChatsPink]) : Gradient(colors: [.fireChatsLightBlue, .fireChatsBlue, .fireChatsPurple])

            VStack {
                
                Rectangle()
                    .withFireChatFormatting()
                    .foregroundStyle(LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
                    .overlay (
                        ZStack {
                            Image("fire")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            // .scaleEffect(0.7)
                                .opacity(0.2)
                            
                            Text(prompt)
                                .bold()
                                .font(.custom("GrandeuxSerifPERSONALUSE-Regular", size: 20))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                                .frame(height: 100)
                                .padding(.horizontal)
                        }
                    )
                    .onChange(of: isHotTapped) { _ in
                        print(isHotTapped.description)
                        
                    }
            }
        
    }
    
}
    



