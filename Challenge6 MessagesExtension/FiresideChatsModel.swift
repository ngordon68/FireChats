//
//  FiresideChatsModel.swift
//  Challenge6 MessagesExtension
//
//  Created by Nick Gordon on 5/2/23.
//

import Foundation


//Cam section for Struct models
struct FiresideChatModel {
    var id = UUID()
    var topic:String
//    var agreeString:String
  //  var agreeCount:Int = 0
//    var disagreeString:String
//    var disagreeCount: Int
}

//Cam section for Classes
class FiresideChats {
    
    
    let fireChatPrompts:[FiresideChatModel] = [
        
        FiresideChatModel(topic: "Apple is better than Android"),
        FiresideChatModel(topic: "Dogs are better pets than cats" ),
        FiresideChatModel(topic: "Downtown Chicago is better than Downtown Detroit"),
        FiresideChatModel(topic: "The Lion King is overrated"),
        FiresideChatModel(topic: "Floyd Mayweather is the best boxer of all time"),
        FiresideChatModel(topic: "Buffalo sauce is better than BBQ sauce"),
        FiresideChatModel(topic: "Flats are better than drums"),
        FiresideChatModel(topic: "Cake is better than pie"),
        FiresideChatModel(topic: "Eastside is better than westside"),
        FiresideChatModel(topic: "American Coney Island is better than Lafayette Conry Island"),
        FiresideChatModel(topic: "Anita Baker is better than Aretha Franklin"),
        FiresideChatModel(topic: "Lebron is better than Michael Jordan"),
        FiresideChatModel(topic: "Brandy is better than Monica"),
        FiresideChatModel(topic: "Michigan is better than MSU"),
        FiresideChatModel(topic: "Slow’s Bbq is trash"),
        FiresideChatModel(topic: "Sada Baby is better than Vezzo"),
        FiresideChatModel(topic: "BMF is better than Power")
        
    ]
}
