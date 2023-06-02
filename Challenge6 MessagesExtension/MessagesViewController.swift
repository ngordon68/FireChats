//
//  MessagesViewController.swift
//  Challenge6 MessagesExtension
//
//  Created by Nick Gordon on 4/30/23.
//

import UIKit
import Messages
import Lottie
import SwiftUI
import AVKit

class MessagesViewController: MSMessagesAppViewController, ObservableObject {
    
    //this section for UI View components needed such
    let sendButton = UIButton() //this button sends out the message
    var receivedView: UIView!
    var sendView : UIView!
    
    let firesideChats = FiresideChats() //this is our class// our prompts
   
    //singleton for the class to be shared for SwiftUI Views and functions
    static let shared = MessagesViewController()
    
    //Published variables needed to update the SwiftUI Views
    @Published var swiftUIText = "FireChats"
    @Published var hotTapped = false
    @Published var coldTapped = false
    @Published var didVote = true
    @Published var startedGame = false
    
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

    //Cam section: for functions. put all functions here
    @objc func randomFireSideChat() {
        
        let vm = MessagesViewController.shared

        print("Random tapped")
        if let firesideChat = firesideChats.fireChatPrompts.randomElement() {
            vm.swiftUIText = firesideChat.topic
            
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
    
    func resetGame() {
        
        let vm = MessagesViewController.shared
        vm.hotTapped = false
        vm.coldTapped = false
        vm.didVote = true
    }
    
   /*
    this section handles sending the game intially to the chat
    there is another function that handles when the user votes and send to chat
    */
    
    @objc func sendMessage() {
        let vmc = MessagesViewController.shared
        if vmc.startedGame == true {
            
            let vm = MessagesViewController.shared
            //for some reason this resets when function is called
            
            var urlComponents = URLComponents()
            var items = [URLQueryItem]()
            
            //the issue is here with the value
            let item = URLQueryItem(name: "name", value: vm.swiftUIText)
            
            items.append(item)
                        
            // Create a message layout with the game content
            let layout = MSMessageTemplateLayout()
            let gameSubtitle = "Tap to vote"
            layout.subcaption = gameSubtitle
            layout.image = .init(view: sendView)
            
            guard let conversation = activeConversation else {
                fatalError("this error for guard")
            }
            // Create a message with the layout and URL
            
            //let session = conversation.selectedMessage?.session ?? MSSession()
            let message = MSMessage(session: MSSession())
            message.layout = layout
            message.summaryText = nil
            
            urlComponents.queryItems = items
            message.url = urlComponents.url
            

            let sender = conversation.selectedMessage?.senderParticipantIdentifier
            
           //layout.caption = "$\(sender?.uuid) likes Sprinkles!"
            
            self.activeConversation?.insert(message)
            
            dismiss()
        }
    }
    
    @objc func sendGameBack() {
        let vm = MessagesViewController.shared
        
        var items = [URLQueryItem]()
        let item = URLQueryItem(name: "name", value: vm.swiftUIText)
        items.append(item)
        let gameSubtitle = "Tap to vote!"
        
        // Create a message layout with the game content
        let layout = MSMessageTemplateLayout()
        layout.subcaption = gameSubtitle
        layout.image = .init(view: receivedView)
       
        
        guard let conversation = activeConversation else {
            fatalError("this error for guard")
        }
        // Create a message with the layout and URL
        
        let session = conversation.selectedMessage?.session ?? MSSession()
        let message = MSMessage(session: MSSession())
        message.layout = layout
        message.summaryText = nil
        
        //let message = MSMessage()
        var urlComponents = URLComponents()
        urlComponents.queryItems = items
        message.url = urlComponents.url
        layout.caption = "$\(conversation.localParticipantIdentifier) has a FireChat!"
        
        self.activeConversation?.insert(message)
        dismiss()    }
   
    //sets up the view componets
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //This is for loading the SwiftUI View
        loadSendMessageView()
        loadVotedView()
        loadInitialView()
        
    }
    
    //function when user taps on the card. downloads the url components to updated view
    
    func presentViewController(for conversation: MSConversation, with presentationStyle: MSMessagesAppPresentationStyle) {
        
       // resetGame()
       
//        self.requestPresentationStyle(.expanded)
//       if presentationStyle == .compact {
//
//
//       } else {
           
           let vm = MessagesViewController.shared
           let message = conversation.selectedMessage
           guard let messageURL = message?.url else { return }
           guard let urlComponents = NSURLComponents(url: messageURL, resolvingAgainstBaseURL: false),
            let queryItems = urlComponents.queryItems else {return}
           
           
           print("\(queryItems.description) is for when tapped open")
           for item in queryItems {

               vm.swiftUIText = item.value!
                      }
         
           let secondView = SecondView()
           let hostingController = UIHostingController(rootView: secondView)
           addChild(hostingController)
           view.addSubview(hostingController.view)
           
           let config = UIImage.SymbolConfiguration(
               pointSize: 50, weight: .medium, scale: .default)
        let image = UIImage(systemName: "arrow.up", withConfiguration: config)?.withTintColor(.systemBackground, renderingMode: .alwaysOriginal)

           

           hostingController.view.translatesAutoresizingMaskIntoConstraints = false
           hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
           hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
           hostingController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
           hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
           
           hostingController.view.addSubview(sendButton)
           sendButton.frame = CGRect(x: 170, y: 30, width: 0, height: 0)
           //sendButton.configuration = .filled()
           sendButton.setImage(image, for: .normal)
           sendButton.translatesAutoresizingMaskIntoConstraints = false
           sendButton.addTarget(self, action: #selector(sendGameBack), for: .touchUpInside)
      
           NSLayoutConstraint.activate([
            sendButton.centerXAnchor.constraint(equalTo: hostingController.view.centerXAnchor),
            sendButton.centerYAnchor.constraint(equalTo: hostingController.view.centerYAnchor, constant: -20)
          
           ])
       }
//   }
    
    //AJ section: this section sets up the view components
    
    /*
     the 3 functions to call the views that are sent into the messages
     */
    
    func loadInitialView() {
        
        let swiftUIView = FirstView()
       
        // Create a new UIHostingController and set its rootView to the SwiftUI view
        let hostingController = UIHostingController(rootView: swiftUIView)
        let config = UIImage.SymbolConfiguration(
            pointSize: 36, weight: .medium, scale: .default)
        let image = UIImage(systemName: "arrow.up.message.fill", withConfiguration: config)?.withTintColor(.black, renderingMode: .alwaysOriginal)
       
        // Add the UIHostingController's view to the view hierarchy
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        // Set the constraints for the UIHostingController's view to fill the parent view
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        hostingController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        hostingController.view.addSubview(sendButton)
        sendButton.frame = CGRect(x: 170, y: 30, width: 0, height: 0)
        //sendButton.configuration = .filled()
        //sendButton.configuration?.baseForegroundColor = .purple
        
        
        sendButton.setImage(image, for: .normal)
        sendButton.translatesAutoresizingMaskIntoConstraints = false

        sendButton.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
   
        NSLayoutConstraint.activate([
         sendButton.centerXAnchor.constraint(equalTo: hostingController.view.centerXAnchor, constant: 30),
         sendButton.centerYAnchor.constraint(equalTo: hostingController.view.centerYAnchor, constant: 20)
       
        ])
    }
    
    func loadSendMessageView() {
        
        let swiftUIView = SendOutView()
        
        // Create a new UIHostingController and set its rootView to the SwiftUI view
        let hostingController = UIHostingController(rootView: swiftUIView)
        
        // Add the UIHostingController's view to the view hierarchy
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        // Set the constraints for the UIHostingController's view to fill the parent view
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        hostingController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            
        self.sendView = hostingController.view
    }
    
    func loadVotedView() {
        let swiftUIView = VotedView()
        
        // Create a new UIHostingController and set its rootView to the SwiftUI view
        let hostingController = UIHostingController(rootView: swiftUIView)
        
        // Add the UIHostingController's view to the view hierarchy
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        // Set the constraints for the UIHostingController's view to fill the parent view
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        hostingController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        self.receivedView = hostingController.view
    }
    
    
    // MARK: - Conversation Handling
    
    //Imessage app life cycle
    
    override func willBecomeActive(with conversation: MSConversation) {
        
        
          //  handleReceivedMessage(message)
            presentViewController(for: conversation, with: presentationStyle)
            
        
        
        // Called when the extension is about to move from the inactive to active state.
        // This will happen when the extension is about to present UI.
        
        // Use this method to configure the extension and restore previously stored state.
    }
    
    override func didResignActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the active to inactive state.
        // This will happen when the user dismisses the extension, changes to a different
        // conversation or quits Messages.
        
        // Use this method to release shared resources, save user data, invalidate timers,
        // and store enough state information to restore your extension to its current state
        // in case it is terminated later.
    }
   
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        // Called when a message arrives that was generated by another instance of this
        // extension on a remote device.
        
        // Use this method to trigger UI updates in response to the message.
        
       // handleReceivedMessage(message)
        presentViewController(for: conversation, with: presentationStyle)
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user taps the send button.
        
        
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
    
        // Use this to clean up state related to the deleted message.
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        
        // Called before the extension transitions to a new presentation style.
    
        // Use this method to prepare for the change in presentation style.
        
        guard let conversation = activeConversation else { fatalError("Expected an active conversation")}
        
        presentViewController(for: conversation, with: presentationStyle)
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        super.didTransition(to: presentationStyle)
        // Called after the extension transitions to a new presentation style.
    
        // Use this method to finalize any behaviors associated with the change in presentation style.
    }
}


//takes copy of view to send to chat
extension UIImage {
    convenience init(view: UIView) {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: image!.cgImage!)
    }
}




