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
                    .animation(Animation.easeIn(duration: 0.5), value: vm.coldTapped)
                    .overlay (
                        
                        ZStack {
                            
                            Image("fire")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(0.7)
                                .opacity(0.2)
 
                            VStack {
                                ShareLink(item: URL(string: "https://testflight.apple.com/join/tUSlOzsM")!) {
                                    
                                    Image(systemName: "square.and.arrow.up")
                                        .font(.system(size: 40))
                                }
                                
                                Text(self.vm.swiftUIText)
                                    .bold()
                                    .font(.largeTitle)
                                
                                HStack {
                                    Spacer()
                                    
                                    Button {
                                        vm.startFire()
                                        vm.playSound(sound: .fire)
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
                                        vm.playSound(sound: .snow)
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
