
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
    var isShowingPromptView = true
}

class MessagesViewController: MSMessagesAppViewController {
    
    var conversation:MSConversation?
    var votedConversation: MSConversation?
    var isShowingPromptView = true
    var compactPresentationStyle: MSMessagesAppPresentationStyle = .compact
  //  var voteHostingController: UIHostingController<VoteView>?
  
    //TEST
    var fireChatsVM = FireChatsViewModel()
    static let shared = MessagesViewController()
   
    //sets up the view componets
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //This is for loading the SwiftUI View
 
        

                      if MessagesViewController.shared.isShowingPromptView == true {
                            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: { [self] in
                                self.conversation = self.activeConversation
                                self.requestPresentationStyle(.compact)
                                print(self.conversation?.description)
                                loadInitialView(conversation: conversation ?? MSConversation(), presentationStyle: compactPresentationStyle)
                                print("InitialView INIT")
                                print("\(presentationStyle.rawValue)")
        
                            })
                       }
//
                if MessagesViewController.shared.isShowingPromptView == false {
                    if let conversation = self.activeConversation {

                        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: { [self] in
                            self.conversation = self.activeConversation
                            self.requestPresentationStyle(.compact)
                           loadVotedView(conversation: conversation)
                            print("loaded voted view INIT")
                            print(conversation.description)

                        })

                    }

                        }
                    
        
      
        
    
       
        //
    }
    

    
    func sendGame(conversation:MSConversation?, prompt: String, startedGame: Bool) {
        print("function start")
        print(conversation?.description)
        
        MessagesViewController.shared.isShowingPromptView = false
        
        if startedGame == true {
            
            
            var urlComponents = URLComponents()
            var items = [URLQueryItem]()
            let item = URLQueryItem(name: "promptName", value: prompt)
            let stateItem = URLQueryItem(name: "gameState", value: MessagesViewController.shared.isShowingPromptView.description)
            
            items.append(item)
            items.append(stateItem)
            
            // Create a message layout with the game content
            let layout = MSMessageTemplateLayout()
            let gameSubtitle = "Tap to vote"
            layout.subcaption = gameSubtitle
        
            let renderer = ImageRenderer(content: SendOutView(prompt: prompt))
            
            if let uiImage = renderer.uiImage {
                // use the rendered image somehow
                layout.image = uiImage
            }
            
            guard let conversation = conversation else {
                fatalError("this error for guard statement to find active conversation")
            }
            // Create a message with the layout and URL
            
           // let message = conversation.selectedMessage?.session ?? MSMessage(session: MSSession())
            let message = MSMessage(session: MSSession())
            message.layout = layout
            message.summaryText = nil
            
            urlComponents.queryItems = items
            message.url = urlComponents.url
            
            let sender = conversation.selectedMessage?.senderParticipantIdentifier
            
            //layout.caption = "$\(sender?.uuid) likes Sprinkles!"
            
            self.conversation = conversation
            self.votedConversation = conversation
            conversation.insert(message)
            print("conversation INSERTED")
            
            dismiss()
        }
    }
    
    func sendGameBack(conversation: MSConversation?, prompt:String) {
        
        
        
        
        print("sendGameBack inited")
        var urlComponents = URLComponents()
        var items = [URLQueryItem]()
        let item = URLQueryItem(name: "name", value: prompt)
        
        items.append(item)
        
        // Create a message layout with the game content
        let layout = MSMessageTemplateLayout()
        let gameSubtitle = "Tap to vote"
        layout.subcaption = gameSubtitle
        //there some nil happening
        
        let renderer = ImageRenderer(content: VotedImessageView(fireChat: fireChatsVM, prompt: prompt))
        
        if let uiImage = renderer.uiImage {
            // use the rendered image somehow
            layout.image = uiImage
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
        
       // let sender = conversation.selectedMessage?.senderParticipantIdentifier
        
        //layout.caption = "$\(sender?.uuid) likes Sprinkles!"
        
        //self.conversation = conversation
        print(conversation.description)
        
        conversation.insert(message)
        

        MessagesViewController.shared.isShowingPromptView = true
        
       
        self.dismiss()
        
        print("sendGameBack completed")
        
    }
    
    
    //function when user taps on the card. downloads the url components to updated view
    
    func presentViewController(for conversation: MSConversation, with presentationStyle: MSMessagesAppPresentationStyle) {
        
        print("insideViewControllerFunction")
        
        requestPresentationStyle(.compact)
        
        let message = conversation.selectedMessage
        guard let messageURL = message?.url else { return }
        guard let urlComponents = NSURLComponents(url: messageURL, resolvingAgainstBaseURL: false),
              let queryItems = urlComponents.queryItems else {return}
        
        
        print("\(queryItems.description) is for when tapped open")
        for item in queryItems {
            
            
            if item.name == "promptName" {
                if let prompt = item.value {
                    fireChatsVM.swiftUIText = prompt
                    print(prompt)
                }
            }
            //do guard let for value later
            else if item.name == "gameState" {
                guard let item = item.value else { return }
                if let gameState = Bool(item) {
                    print(gameState.description)
                    MessagesViewController.shared.isShowingPromptView = gameState
                
                }
            }
        }
        
        
        if MessagesViewController.shared.isShowingPromptView == false {
            
            //self.requestPresentationStyle(.compact)
            
            self.votedConversation = self.activeConversation
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: { [self] in
     
                loadVotedView(conversation: self.activeConversation ?? MSConversation())
                
                print(votedConversation?.description)
                print("VotedView inside presentviewcontroller")
                print("\(presentationStyle.rawValue)")
            })
                 
                }
    }
    //   }
    
    func loadInitialView(conversation:MSConversation, presentationStyle: MSMessagesAppPresentationStyle) {
        
        
        let promptView = PromptView(fireChat: fireChatsVM, conversation: conversation)
        
        
        // Create a new UIHostingController and set its rootView to the SwiftUI view
        let hostingController = UIHostingController(rootView: promptView)
     
        
        // Add the UIHostingController's view to the view hierarchy
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        // Set the constraints for the UIHostingController's view to fill the parent view
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        hostingController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func loadVotedView(conversation: MSConversation) {
        let secondView = VoteView(fireChat: fireChatsVM, conversation: conversation)
        
        // Create a new UIHostingController and set its rootView to the SwiftUI view
        let hostingController = UIHostingController(rootView: secondView)
        
  
        
        // Add the UIHostingController's view to the view hierarchy
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        // Set the constraints for the UIHostingController's view to fill the parent view
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        hostingController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
    }

    // MARK: - Conversation Handling
    
    //Imessage app life cycle
    
    override func willBecomeActive(with conversation: MSConversation) {
  
        print("willBecomeActive is CALLED")
       // self.requestPresentationStyle(.compact)
        
        if MessagesViewController.shared.isShowingPromptView == false {
            
            presentViewController(for: conversation, with: .expanded)
        }
        
        if MessagesViewController.shared.isShowingPromptView == true {
            
            loadInitialView(conversation: conversation, presentationStyle: .compact)
        }
        
  
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
        MessagesViewController.shared.isShowingPromptView = true
    }
    
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        // Called when a message arrives that was generated by another instance of this
        // extension on a remote device.
        
        // Use this method to trigger UI updates in response to the message.
        
        // handleReceivedMessage(message)
//        print("didReceive FUNCTION")
//
//        presentViewController(for: conversation, with: presentationStyle)
//        //  loadVotedView()
        
       

        
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user taps the send button.
        //self.conversation = conversation
        print("did start sending function called")
        MessagesViewController.shared.isShowingPromptView = false
        
        
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
        
        // Use this to clean up state related to the deleted message.
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        
        // Called before the extension transitions to a new presentation style.
        
        // Use this method to prepare for the change in presentation style.
        print("WILL TRANSITION FUNC IS CALLED")
        
        self.requestPresentationStyle(.compact)
        guard let conversation = self.activeConversation else { fatalError("Expected an active conversation")}
           
           presentViewController(for: conversation, with: presentationStyle)
       }
       

        
    
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        super.didTransition(to: presentationStyle)
        // Called after the extension transitions to a new presentation style.
        
        // Use this method to finalize any behaviors associated with the change in presentation style.
    }
}












