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
          
          var body: some View {
              
              let gradient = fireChat.hotTapped ? Gradient(colors: [.fireChatsYellow, .fireChatsOrange, .fireChatsRed, .fireChatsPink]) : Gradient(colors: [.fireChatsLightBlue, .fireChatsBlue, .fireChatsPurple])
              
              Rectangle()
                  .withFireChatFormatting()
                  .foregroundStyle(LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
                  .overlay (
                  
                              Text(prompt)
                                  .bold()
                                  .font(.custom("GrandeuxSerifPERSONALUSE-Regular", size: 20))
                                  .multilineTextAlignment(.center)
                                  .foregroundColor(.white)
                                  .frame(height: 100)
                                  .padding(.horizontal)
                              )
          }
      }
                          
    


