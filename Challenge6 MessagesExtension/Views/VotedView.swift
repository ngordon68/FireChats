//
//  VotedView.swift
//  Challenge6 MessagesExtension
//
//  Created by Nick Gordon on 5/14/23.
//

import SwiftUI

struct VotedView: View {
    @StateObject var vm = MessagesViewController.shared
    var body: some View {
        Rectangle()
            .frame(width: 350, height: 300)
            .cornerRadius(20)
            .foregroundColor(vm.didVote ? .orange : vm.coldTapped ? .blue: .red)
            .animation(Animation.easeIn(duration: 3.0), value: vm.coldTapped)
            .overlay (
            
                        Text(self.vm.swiftUIText)
                            .bold()
                            .font(.largeTitle)
                        )
    }
}
                    

struct VotedView_Previews: PreviewProvider {
    static var previews: some View {
        VotedView()
    }
}
