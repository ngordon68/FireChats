//
//  SwiftUIView.swift
//  Challenge6 MessagesExtension
//
//  Created by Nick Gordon on 4/30/23.
//

import SwiftUI
import Messages

struct SwiftUIView: View {

    //@StateObject var vm = MessagesViewController()
   // @StateObject var man = MessageManager()
    
  

   var body: some View {
       
        VStack {
           Text("FireSide Chats")
                .foregroundColor(.pink)
                .font(.largeTitle)
                .bold()
                
                .background(
                    Rectangle()
                        .frame(width: 350, height:400)
                        .cornerRadius(20)
                )
  
            
            HStack{
                Button {
                 //   vm.increase()
                   
                } label: {
                    Text("add")
                }
                .buttonStyle(.bordered)
                
                Button {
                   // vm.sendMessage()
               
                    
                    
                } label: {
                    Text("send to group")
                }
                .buttonStyle(.bordered)
                
            }
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
