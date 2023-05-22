//
//  SecondView.swift
//  Challenge6 MessagesExtension
//
//  Created by Nick Gordon on 5/7/23.
//

import SwiftUI

struct SecondView: View {
    

    
    @StateObject var vm = MessagesViewController.shared

    var body: some View {
        
        ZStack {
            
            if vm.coldTapped == true {
                
                LottieView(animationName: "SnowEffect")
                    .scaleEffect(1)
                
                
            }
            
            
            if vm.hotTapped == true {
                LottieView(animationName: "Burning")
                    .scaleEffect(0.85)
                    .offset(y: -80)
                
            }
            
            VStack {
    
                Rectangle()
                    .frame(width: 350, height: 300)
                    .cornerRadius(20)
                    .foregroundColor(vm.didVote ? .orange : vm.coldTapped ? .blue: .red)
                    .animation(Animation.easeIn(duration: 1.0), value: vm.coldTapped)
                    .overlay (
                        
                        ZStack {
//                            Image("fire")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .opacity(0.2)
                            
                            VStack {
                                Text(self.vm.swiftUIText)
                                    .bold()
                                    .font(.largeTitle)
                                HStack {
                                    Spacer()
                                    
                                    Button {
                                        vm.startFire()
                                    } label: {
                                        Text("🔥")
                                            .font(.system(size: 50))
                                            .overlay (
                                                Text("👍🏾")
                                                    .foregroundColor(.black)
                                                    .bold()
                                                    .font(.caption)
                                            )
                                    }
                                    
                                    
                                    Spacer()
                                    
                                    Button {
                                        vm.startCold()
                                    } label: {
                                        
                                        Text("❄️")
                                            .font(.system(size: 50))
                                            .overlay (
                                                Text("👎🏾")
                                                    .foregroundColor(.black)
                                                    .bold()
                                                    .font(.caption)
                                            )
                                    }
                      
                                    
                                    Spacer()
                                    
                                }
                                
                                
                            }
                            
                        }
                    )
                
                
                
                
            }  .offset(y: 150)
            
        }
    }
}

//struct SecondView_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondView(v)
//    }
//}
