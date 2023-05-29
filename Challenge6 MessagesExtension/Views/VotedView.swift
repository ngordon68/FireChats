//
//  VotedView.swift
//  Challenge6 MessagesExtension
//
//  Created by Nick Gordon on 5/14/23.
//

import SwiftUI

struct VotedView: View {
    
    @StateObject var vm = MessagesViewController.shared
    @State var appColors = AppColors()
    
    var body: some View {
        
        let gradient = vm.hotTapped ? Gradient(colors: [Color(appColors.yellow), Color(appColors.orange), Color(appColors.red), Color(appColors.pink)]) : Gradient(colors: [Color(appColors.lightBlue), Color(appColors.blue), Color(appColors.purple)])
        
        Rectangle()
            .frame(width: 350, height: 300)
            .cornerRadius(20)
            .foregroundStyle(LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
            .shadow(color: .black, radius: 5, x: 0, y: 0)

            .overlay (
            
                        Text(self.vm.swiftUIText)
                            .bold()
                            .font(.custom("GrandeuxSerifPERSONALUSE-Regular", size: 20))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .frame(height: 100)
                            .padding(.horizontal)
                        )
    }
}
                    

struct VotedView_Previews: PreviewProvider {
    static var previews: some View {
        VotedView()
    }
}
