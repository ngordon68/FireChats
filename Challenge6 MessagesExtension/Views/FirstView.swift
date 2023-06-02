//
//  FirstView.swift
//  Challenge6 MessagesExtension
//
//  Created by Nick Gordon on 5/6/23.
//

import SwiftUI
import Messages


struct FirstView: View {
    
    @StateObject var vm = MessagesViewController.shared
    var activeConversation: MSConversation?
    @State var appColors = AppColors()
    
//    init() {
//
//        for familyName in UIFont.familyNames {
//            print(familyName)
//
//            for fontName in UIFont.fontNames(forFamilyName: familyName) {
//                print("--\(fontName)")
//            }
//        }
//    }
    
    var body: some View {
        
       // let gradient = vm.hotTapped ? Gradient(colors: [Color.yellow, Color.red]) : Gradient(colors: [Color.white, Color.blue])
        
        let gradient = Gradient(colors: [Color(appColors.yellow), Color(appColors.orange), Color(appColors.red), Color(appColors.pink)])
        
        
            VStack {
                
                Rectangle()
                    .foregroundStyle(LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 300, height: 200)
                    .cornerRadius(20)
                    .shadow(color: .black, radius: 5, x: 0, y: 0)
                    .overlay (
                        
                        ZStack {
                            
                            Image("fire")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(0.7)
                                .opacity(0.2)
                            
                            VStack {
                                
                                Button {
                                    
                                    
                                } label: {
                                    Image(systemName: "square.and.pencil")
                                       // .font(.system(size: 36))
                                        .font(.largeTitle)
                                        .foregroundColor(.white)
                                    
                                }
                                //.padding(.top, 30)
                                .offset(y: 20)
                                
                                
                                Text(self.vm.swiftUIText)
                                  
                                    .font(.custom("GrandeuxSerifPERSONALUSE-Regular", size: 20))
                                    .minimumScaleFactor(0.2)
                                    .frame(height: 100)
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                                
                                
                                Button {
                                    vm.randomFireSideChat()
                                    vm.playSound(sound: .random)
                                    
                                } label: {
                                    Image(systemName: "arrow.clockwise.circle")
                                        .foregroundColor(.black)
                                       // .font(.system(size: 36))
                                        .font(.largeTitle)
                                    
                                }
                                
                                .padding(.trailing, 100)
                                .padding(.bottom, 30)
                                
                            }
                            
                        }
                    )
               
            }
        //VStack
            
       // } // Geo reader
        
    }
}



struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
