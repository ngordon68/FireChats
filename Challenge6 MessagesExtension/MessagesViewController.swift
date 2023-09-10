
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

class GameState {
    static let shared = GameState()
    var isShowingPromptView = true
}

class MessagesViewController: MSMessagesAppViewController {
    
    var conversation:MSConversation?
    var compactPresentationStyle: MSMessagesAppPresentationStyle = .compact
    var currentRenderedImage = Image("AppIcon")

    //TEST
    var fireChatsVM = FireChatsViewModel()
    static let shared = MessagesViewController()
   
    //sets up the view componets
    override func viewDidLoad() {
        super.viewDidLoad()
 
   
        
      //  if GameState.shared.isShowingPromptView == true {
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100), execute: { [self] in
                self.conversation = self.activeConversation
               // self.requestPresentationStyle(.expanded)
                print(self.conversation?.description)
                loadInitialView(conversation: conversation ?? MSConversation(), presentationStyle: .compact, parentViewController: MessagesViewController.shared)
                
                print("init is called")


            })
       // }
//
//        if GameState.shared.isShowingPromptView == false {
//            if let conversation = self.activeConversation {
//
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(5000), execute: { [self] in
                    self.conversation = self.activeConversation
                    self.requestPresentationStyle(.expanded)
                    loadVotedView(conversation: conversation ?? MSConversation(), parentViewController: MessagesViewController.shared)
                    print("loaded voted view INIT")
                    //print(conversation.description)

                })
//
//            }
//
//        }
      
    }
      
    func sendGame(conversation:MSConversation?, prompt: String, startedGame: Bool) {
 
        GameState.shared.isShowingPromptView = false
  
        if startedGame == true {
   
            var urlComponents = URLComponents()
            var items = [URLQueryItem]()
            let item = URLQueryItem(name: "promptName", value: prompt)
            let stateItem = URLQueryItem(name: "gameState", value: GameState.shared.isShowingPromptView.description)
            
            items.append(item)
            items.append(stateItem)
            
            // Create a message layout with the game content
            let layout = MSMessageTemplateLayout()
            let gameSubtitle = "Tap to vote"
            layout.subcaption = gameSubtitle
            
            let renderer = ImageRenderer(content: SendOutView(prompt: prompt))
            
            //renderer.scale = .greatestFiniteMagnitude
            if let uiImage = renderer.uiImage {
               

                let scaledImage = UIImage(cgImage: uiImage.cgImage!, scale: 3.0, orientation: uiImage.imageOrientation)
                layout.image = scaledImage
                
            }
            
            guard let conversation = conversation else {
                fatalError("this error for guard statement to find active conversation")
            }
            // Create a message with the layout and URL
            
            // let message = conversation.selectedMessage?.session ?? MSMessage(session: MSSession())
            let message = MSMessage(session: MSSession())
            
            //layout.caption = "$\(conversation.localParticipantIdentifier.uuidString) sent a FireChat"
            // layout.caption = "A fi"
            print(layout.caption)
            
            message.layout = layout
            message.summaryText = nil
            
            urlComponents.queryItems = items
            message.url = urlComponents.url
            
            let sender = conversation.selectedMessage?.senderParticipantIdentifier
            
            //layout.caption = "$\(sender?.uuid) likes Sprinkles!"
           
            self.conversation = conversation
            conversation.insert(message)
    
        }
    }
    
    func sendGameBack(conversation: MSConversation?, prompt:String, isHotTapped:Bool) {
        
      //  var colorState = MessagesViewController()
        var urlComponents = URLComponents()
        var items = [URLQueryItem]()
        let item = URLQueryItem(name: "name", value: prompt)
        
        items.append(item)
        
        // Create a message layout with the game content
        let layout = MSMessageTemplateLayout()
 
        let renderer = ImageRenderer(content: VotedImessageView(fireChat: MessagesViewController.shared.fireChatsVM, prompt: prompt, isHotTapped: isHotTapped))
            
        if let uiImage = renderer.uiImage {
                // use the rendered image somehow
          //  let scaledImage = UIImage(cgImage: uiImage.cgImage!, scale: 3.0, orientation: uiImage.imageOrientation)
            let scaledImage = UIImage(cgImage: uiImage.cgImage!, scale: UIScreen.main.nativeScale, orientation: uiImage.imageOrientation)

                layout.image = scaledImage
            }
       
       
        
        guard let conversation = conversation else {
            fatalError("this error for guard statement to find active conversation")
        }
        // Create a message with the layout and URL
        
        //let session = conversation.selectedMessage?.session ?? MSSession()
        let message = MSMessage(session: MSSession())
        message.layout = layout
        message.summaryText = nil
        
        urlComponents.queryItems = items
        message.url = urlComponents.url
        
        print(conversation.description)
        conversation.insert(message)

        MessagesViewController.shared.dismiss()

    }
   
    //function when user taps on the card. downloads the url components to updated view
    
    func presentViewController(for conversation: MSConversation, with presentationStyle: MSMessagesAppPresentationStyle) {
        
        print("insideViewControllerFunction")
        print(GameState.shared.isShowingPromptView.description)
        
        GameState.shared.isShowingPromptView = false
      
        let message = conversation.selectedMessage
        guard let messageURL = message?.url else { return }
        guard let urlComponents = NSURLComponents(url: messageURL, resolvingAgainstBaseURL: false),
              let queryItems = urlComponents.queryItems else {return}
        
        
        //print("\(queryItems.description) is for when tapped open")
        for item in queryItems {
            
            
            if item.name == "promptName" {
                if let prompt = item.value {
                    fireChatsVM.swiftUIText = prompt
                   
                }
            }
            //do guard let for value later
            else if item.name == "gameState" {
                guard let item = item.value else { return }
                if let currentGameState = Bool(item) {
                    
                    GameState.shared.isShowingPromptView  = currentGameState
                    print(GameState.shared.isShowingPromptView.description)
                  
                
                 
                    
                }
            }
        }
        
        

     
//        if GameState.shared.isShowingPromptView == true {
//            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100), execute: { [self] in
//                self.conversation = self.activeConversation
//               // self.requestPresentationStyle(.expanded)
//                print(self.conversation?.description)
//                loadInitialView(conversation: conversation ?? MSConversation(), presentationStyle: .compact, parentViewController: MessagesViewController.shared)
//
//            })
//        }
        
       // if GameState.shared.isShowingPromptView == false {
            print("\(GameState.shared.isShowingPromptView.description) after loading state")
            DispatchQueue.main.asyncAfter(deadline: .now() + .nanoseconds(5000), execute: { [self] in
  
                loadVotedView(conversation: self.activeConversation ?? MSConversation(), parentViewController: MessagesViewController.shared)
                
                print("VotedView inside presentviewcontroller")
                //print("\(presentationStyle.rawValue)")
            })
       // }
        
         //  }
    }
    

    // MARK: - Conversation Handling
    
    //Imessage app life cycle
    
    override func willBecomeActive(with conversation: MSConversation) {
        
       print("willBecomeActive is CALLED")
        //self.requestPresentationStyle(.expanded)
        //print(GameState.shared.isShowingPromptView.description)
        

        presentViewController(for: conversation, with: .expanded)
        
        
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
        
        print("did resign function called")
        GameState.shared.isShowingPromptView = true
        
  
        
    }
    
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        // Called when a message arrives that was generated by another instance of this
        // extension on a remote device.
        
        // Use this method to trigger UI updates in response to the message.
             
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user taps the send button.
        //self.conversation = conversation
//        print("did start sending function called")
//        MessagesViewController.shared.isShowingPromptView = false
        
        GameState.shared.isShowingPromptView = false
        
        
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
        
        // Use this to clean up state related to the deleted message.
        print("cancel function was called")
        GameState.shared.isShowingPromptView = true
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        
        // Called before the extension transitions to a new presentation style.
        
        // Use this method to prepare for the change in presentation style.
        print("WILL TRANSITION FUNC IS CALLED")
      //  print(GameState.shared.isShowingPromptView.description)
    
        
        
        //  super.willTransition(to: presentationStyle)
        
        guard let conversation = self.activeConversation else { fatalError("Expected an active conversation")}

        presentViewController(for: conversation, with: .expanded)
    }
    

    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        super.didTransition(to: presentationStyle)
        // Called after the extension transitions to a new presentation style.
        
        // Use this method to finalize any behaviors associated with the change in presentation style.
    }
    

    func loadInitialView(conversation:MSConversation, presentationStyle: MSMessagesAppPresentationStyle, parentViewController: UIViewController) {
        
        
        let promptView = PromptView(fireChat: fireChatsVM, conversation: conversation, parentViewController: self)
        
        
        // Create a new UIHostingController and set its rootView to the SwiftUI view
        let hostingController = UIHostingController(rootView: promptView)
        
        
        // Add the UIHostingController's view to the view hierarchy
       // addChild(hostingController)
        view.addSubview(hostingController.view)
        
        // Set the constraints for the UIHostingController's view to fill the parent view
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        hostingController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func loadVotedView(conversation: MSConversation, parentViewController: UIViewController) {

        let secondView = VoteView(fireChat: fireChatsVM, conversation: conversation, parentViewController: self)
        
        // Create a new UIHostingController and set its rootView to the SwiftUI view
        let hostingController = UIHostingController(rootView: secondView)
        
        // Add the UIHostingController's view to the view hierarchy
       // addChild(hostingController)
        view.addSubview(hostingController.view)
        
        //present(hostingController, animated: true, completion: nil)
        
        // Set the constraints for the UIHostingController's view to fill the parent view
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        hostingController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    }
}



