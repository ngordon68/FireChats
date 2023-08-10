//
//  FireChatsViewModel.swift
//  FireChats MessagesExtension
//
//  Created by Nick Gordon on 7/24/23.
//

import Foundation
import Messages
import AVKit


class FireChatsViewModel: ObservableObject {
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case fire
        case snow2
        case random
    }
    
    func playSound(sound:SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("error \(error)")
        }
    }
    
    @Published var swiftUIText = "FireChats"
    @Published var hotTapped = false
    @Published var coldTapped = false
    @Published var didVote = true
    @Published var startedGame = false
    @Published var remainingCustomPrompts = 3
    @Published var isshowingPromptField = false
    
    let fireChatsPrompts = FireChats()

    func generateRandomPrompt() {
  
        if let prompt = fireChatsPrompts.fireChatPrompts.randomElement() {
            swiftUIText = prompt.topic
            startedGame = true
        
            
        }
    }
    
    func startFire() {
        didVote = false
        hotTapped = true
        coldTapped = false
    }
    
    func startCold() {
        didVote = false
        hotTapped = false
        coldTapped = true
    }
    
    
    /*
     make function to where votes are counted and total votes affect the state of the card
     */
    
//    func resetGame() {
//
//       // let vm = MessagesViewController.shared
//        vm.hotTapped = false
//        vm.coldTapped = false
//        vm.didVote = true
//    }
    
    /*
     make function to where votes are counted and total votes affect the state of the card
     */
    
 
//    func showPromptField() {
//
//        let vm = MessagesViewController.shared
//        vm.isshowingPromptField.toggle()
//
//        if vm.isshowingPromptField == true {
//            requestPresentationStyle(.expanded)
//            vm.swiftUIText = "Please enter prompt"
//            vm.remainingCustomPrompts -= 1
//        }
//    }
    
}
