//
//  SecondView.swift
//  Challenge6 MessagesExtension
//
//  Created by Nick Gordon on 5/7/23.
//

import SwiftUI

class notificationViewModel {
    
    func alertUser() {
        
        //put function
    }
    
    func triggerOnTap() {
        
    }
}

struct SecondView: View {
    
    @StateObject var vm = MessagesViewController.shared
    @State var appColors = AppColors()
    var notificationVM = notificationViewModel()

    var body: some View {
        
        let gradient = vm.hotTapped ? Gradient(colors: [Color(appColors.yellow), Color(appColors.orange), Color(appColors.red), Color(appColors.pink)]) : Gradient(colors: [Color(appColors.lightBlue), Color(appColors.blue), Color(appColors.purple)])
        
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
                    //.foregroundColor(vm.didVote ? .orange : vm.coldTapped ? .blue: .red)
                    .foregroundStyle(LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
                    .animation(Animation.easeIn(duration: 0.5), value: vm.coldTapped)
                    .shadow(color: .black, radius: 5, x: 0, y: 0)
                    .overlay (
                        
                        ZStack {
                            
                            Image("fire")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(0.7)
                                .opacity(0.2)
 
                            VStack {
                                
                                
    
                                Text(self.vm.swiftUIText)
                                    .bold()
                                    .font(.custom("GrandeuxSerifPERSONALUSE-Regular", size: 40))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .frame(height: 100)
                                    .padding(.horizontal)
                                
                                HStack {
                                    Spacer()
                                    
                                    Button {
                                        vm.startFire()
                                        vm.playSound(sound: .fire)
                                    } label: {
                                        Text("👍")
                                            .foregroundColor(.black)
                                            .bold()
                                          
                                    }
                                    .font(.largeTitle)
                                    
                                    
                                    Spacer()
                                    
                                    Button {
                                        vm.startCold()
                                        vm.playSound(sound: .snow)
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
                    )
                
                
                ShareLink(item: URL(string: "https://testflight.apple.com/join/tUSlOzsM")!) {
                    
                    Rectangle()
                        .foregroundStyle(LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
                        .animation(Animation.easeIn(duration: 2), value: vm.coldTapped)
                        .frame(width: 150)
                        .frame(height: 50)
                        .cornerRadius(20)
                        .shadow(color: .black, radius: 5, x: 0, y: 0)
                        .overlay (
                   Text("SHARE")
                    .font(.custom("GrandeuxSerifPERSONALUSE-Regular", size: 40))
                        .foregroundColor(.white)
                   )
                }
                
            }  .offset(y: 150)
            
        }
    }
}

//struct SecondView_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondView(v)
//    }
//}
