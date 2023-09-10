//
//  SecondView.swift
//  Challenge6 MessagesExtension
//
//  Created by Nick Gordon on 5/7/23.
//

import SwiftUI
import Messages
import Social
import Messages


struct VoteView: View {
    
 
    var vm = MessagesViewController.shared
    @ObservedObject var fireChat:FireChatsViewModel
    var conversation: MSConversation?
    @State private var currentRenderedImage = Image("AppIcon")
    
    var parentViewController: MessagesViewController

    
  

    var body: some View {
        let gradient = fireChat.hotTapped ? Gradient(colors: [.fireChatsYellow, .fireChatsOrange, .fireChatsRed, .fireChatsPink]) : Gradient(colors: [.fireChatsLightBlue, .fireChatsBlue, .fireChatsPurple])
    
        
        ZStack {
       
            if fireChat.coldTapped == true {
                
                LottieView(animationName: "SnowEffect")
                    .scaleEffect(1)
            }
            
            if fireChat.hotTapped == true {
                LottieView(animationName: "Burning")
                   // .scaleEffect(0.85)
                    .frame(width: UIScreen.main.bounds.size.width * 0.88)
                    .scaleEffect(0.90)
                    .offset(y: -110)
            }
            
            
            VStack {
                
                
                Rectangle()
                    .frame(width: 350, height: 300)
                    .cornerRadius(20)
                    .shadow(color: .black, radius: 5, x: 0, y: 0)
                    .foregroundStyle(LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
                    .animation(Animation.easeIn(duration: 0.5), value: fireChat.coldTapped)
                    .overlay (
                       CardComponents

                    )
                

                ShareLink(
                    item: vm.currentRenderedImage,
              
                          preview: SharePreview("share ",
                                                image: Image(systemName: "Circle")
                                              ))

                {

                    Rectangle()
                        .foregroundStyle(LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
                        .animation(Animation.easeIn(duration: 2), value: fireChat.coldTapped)
                        .frame(width: 150)
                        .frame(height: 50)
                        .cornerRadius(20)
                        .shadow(color: .black, radius: 5, x: 0, y: 0)
                        .overlay (
                   Text("SHARE")
                        .font(.custom("GrandeuxSerifPERSONALUSE-Regular", size: 20))
                        .foregroundColor(.black)
                        .minimumScaleFactor(0.8)
                   )
                }

                

                
            }
            .offset(y: 150)
            
        }
    }
    
    
    var CardComponents: some View {
        ZStack {
            Image("fire")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(0.7)
                .opacity(0.2)

            VStack {

                Button() {
                    if let conversation = conversation {
 
                        vm.sendGameBack(conversation: conversation, prompt: fireChat.swiftUIText, isHotTapped: fireChat.hotTapped)
                        
                        parentViewController.dismiss()

                }
                } label: {
                    Image(systemName: "arrow.up.message.fill")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                    
                }
                
                Text(self.fireChat.swiftUIText)
                    .bold()
                    .font(.custom("GrandeuxSerifPERSONALUSE-Regular", size: 20))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .minimumScaleFactor(0.2)
                    .frame(height: 100)
                    .padding(.horizontal)
                
                HStack {
                    Spacer()
                    
                    Button {
                        fireChat.startFire()
                        fireChat.playSound(sound: .fire)
                        renderView()
                    } label: {
                        Text("👍")
                            .foregroundColor(.black)
                            .bold()
                          
                    }
                    .font(.largeTitle)
                    
                    
                    Spacer()
                    
                    Button {
                        fireChat.startCold()
                        fireChat.playSound(sound: .snow2)
                        renderView()
                    } label: {
     
                        Text("👎")
                            .foregroundColor(.black)
                            .bold()
                            .font(.largeTitle)
                    }
      
                    
                    Spacer()
                    
                }
                .padding(.bottom, 10)
            
            }
            
        }
    }

    func renderView() -> Image {
        //let renderer = ImageRenderer(content: VotedImessageView(fireChat: vm.fireChatsVM, prompt: fireChat.swiftUIText))
        let renderer = ImageRenderer(content: VotedImessageView(fireChat: vm.fireChatsVM, prompt: fireChat.swiftUIText, isHotTapped: fireChat.hotTapped))
        // make sure and use the correct display scale for this device
        renderer.scale = UIScreen.main.scale

        if let uiImage = renderer.uiImage {
            vm.currentRenderedImage = Image(uiImage: uiImage)
        }
        
        return vm.currentRenderedImage
    }
    
}




