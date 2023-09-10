//
//  FirstView.swift
//  Challenge6 MessagesExtension
//
//  Created by Nick Gordon on 5/6/23.
//

import SwiftUI
import Messages


struct PromptView: View {
        
    @ObservedObject var fireChat:FireChatsViewModel
     var vm = MessagesViewController.shared

    @State var isShowingPurchasedView = false
    
    var conversation: MSConversation?
    var parentViewController: MessagesViewController
   
   
    var body: some View {
//
//        let gradient = Gradient(colors: [.fireChatsYellow, .fireChatsOrange, .fireChatsRed, .fireChatsPink])
        let gradient = Gradient(colors: [.fireChatsYellow, .fireChatsPurple])
        
        ZStack {
            
            VStack {
                
                Rectangle()
                    .foregroundStyle(LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
                    .withFireChatFormatting()
                    .overlay (
                        
                        ZStack {
                            
                            Image("fire")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(0.7)
                                .opacity(0.2)
                            
                            VStack {
  
                                if fireChat.isshowingPromptField == true {
                                    
                                    TextField("Enter prompt", text: $fireChat.swiftUIText)
                                        .font(.custom("GrandeuxSerifPERSONALUSE-Regular", size: 20))
                                        .minimumScaleFactor(0.2)
                                        .frame(height: 100)
                                        .frame(width: 250)
                                        .foregroundColor(.black)
                                        .padding(.horizontal)
                                }
                                
                                if fireChat.isshowingPromptField == false {
                                    
                                    Text(self.fireChat.swiftUIText)
                                        .font(.custom("GrandeuxSerifPERSONALUSE-Regular", size: 20))
                                        .minimumScaleFactor(0.2)
                                        .frame(height: 100)
                                        .foregroundColor(.black)
                                        .padding(.horizontal)
            
                                }
                                
                                HStack {
                                    Spacer()
                                    Button {
                                        fireChat.generateRandomPrompt()
                                        fireChat.playSound(sound: .random)
                                        
                                    } label: {
                                        Image(systemName: "arrow.clockwise.circle")
                                            .foregroundColor(.black)
                                            .font(.largeTitle)
                                        
                                    }
                               
                                    Spacer()
                                    
                                    Button {
                                        if let conversation = conversation {
                                            vm.sendGame(conversation: conversation, prompt: fireChat.swiftUIText, startedGame: fireChat.startedGame)
                                           // parentViewController.dismiss()
                                        }
                                    } label: {
                                        Image(systemName: "arrow.up.message.fill")
                                            .foregroundColor(.black)
                                            .font(.largeTitle)
                                        
                                    }
                                  
                                   Spacer()
                                }
                                    
                                }
                           
                            .sheet(isPresented: $isShowingPurchasedView) {
                                Text("code for store is here")
                                    .presentationDragIndicator(.visible)
                            }
                            
                        }
                    )
            }
          
            
//            Button {
//                isShowingPurchasedView.toggle()
//            } label: {
//                Image(systemName: "lock.circle.fill")
//                    .font(.largeTitle)
//                    .foregroundColor(.black)
//            }
//            .padding(.bottom, 155)
            
        }//zstack ends here
        
    }
}


