//
//  SendOutView.swift
//  Challenge6 MessagesExtension
//
//  Created by Nick Gordon on 5/12/23.
//

import SwiftUI

struct SendOutView: View {
    
    @StateObject var vm = MessagesViewController.shared
    
    var body: some View {
    
            Rectangle()
                .frame(width: 300, height: 200)
                .cornerRadius(20)
                .foregroundColor(.orange)
                .overlay (
                    
                    ZStack {
//                        Image("fire")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .opacity(0.2)
                        
                        
                        Text(self.vm.swiftUIText)
                            .bold()
                            .font(.title3)
    
                    }
                )
           }
}

struct SendOutView_Previews: PreviewProvider {
    static var previews: some View {
        SendOutView()
    }
}
