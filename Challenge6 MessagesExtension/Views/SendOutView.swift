//
//  SendOutView.swift
//  Challenge6 MessagesExtension
//
//  Created by Nick Gordon on 5/12/23.
//

import SwiftUI

struct SendOutView: View {
    
    @StateObject var vm = MessagesViewController.shared
    
    @State var appColors = AppColors()
    
    
    var body: some View {
        
        let gradient = Gradient(colors: [Color(appColors.yellow), Color(appColors.orange), Color(appColors.red), Color(appColors.pink)])
        
    
            Rectangle()
            
                .frame(width: 300, height: 200)
                .cornerRadius(20)
                //.foregroundColor(.orange)
                .foregroundStyle(LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
                .shadow(color: .black, radius: 5, x: 0, y: 0)
                .overlay (
                    
                    ZStack {
//                        Image("fire")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .opacity(0.2)
                        
                        
                        Text(self.vm.swiftUIText)
                            .font(.custom("GrandeuxSerifPERSONALUSE-Regular", size: 20))
                            .padding(.horizontal)
    
                    }
                )
           }
}

struct SendOutView_Previews: PreviewProvider {
    static var previews: some View {
        SendOutView()
    }
}
