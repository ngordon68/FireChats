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
    
    var body: some View {
      //  GeometryReader { geo in
            VStack {
                
                Rectangle()
                    .frame(width: 300, height: 200)
                    .cornerRadius(20)
                    .foregroundColor(.orange)
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
                                    .font(.title3)
                                    .frame(height: 100)
                                
                                
                                Button {
                                    vm.randomFireSideChat()
                                    
                                } label: {
                                    Image(systemName: "arrow.clockwise.circle")
                                        .foregroundColor(.white)
                                        .font(.system(size: 36))
                                    
                                }
                                
                                .padding(.trailing, 100)
                                .padding(.bottom, 30)
                                
                                
                            }
                            
                        }
                    )
                    .overlay  (
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "square.and.pencil")
                                .font(.system(size: 36))
                            
                        }
                        ,
                        alignment: .topTrailing
                        
                        
                        
                    )
                
                
            }
            
        }
        
  //  }
}



struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
