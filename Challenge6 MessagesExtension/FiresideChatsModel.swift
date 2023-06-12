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
    //var duration: Int
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
        FiresideChatModel(topic: "Anita Baker is better than Aretha Franklin"),
        FiresideChatModel(topic: "Lebron is better than Michael Jordan"),
        FiresideChatModel(topic: "Brandy is better than Monica"),
        FiresideChatModel(topic: "Michigan is better than MSU"),
        FiresideChatModel(topic: "Sada Baby is better than Vezzo"),
        FiresideChatModel(topic: "BMF is better than Power"),
        FiresideChatModel(topic: "DC is better than Marvel"),
        FiresideChatModel(topic: "Apple juice is better than Orange juice"),
        FiresideChatModel(topic: "Hotdogs are a form of a sandwhich"),
        FiresideChatModel(topic: "Boneless wings are better than Bone-in"),
        FiresideChatModel(topic: "Wendys is better than McDonalds"),
        FiresideChatModel(topic: "Waffles are more popular than Pancakes"),
        FiresideChatModel(topic: "Fall is the best season"),
        FiresideChatModel(topic: "Everyone should travel alone atleast once in their life"),
        FiresideChatModel(topic: "Pepsi is a better product than Coke"),
        FiresideChatModel(topic: "Tomatoes are a fruit"),
        FiresideChatModel(topic: "Pie is a better dessert than cake"),
        FiresideChatModel(topic: "hot sandwiches are better than cold sandwiches"),
        FiresideChatModel(topic: "smooth peanut butter is better than crunchy"),
        FiresideChatModel(topic: "hard shell tacos are better than soft shell"),
        FiresideChatModel(topic: "SnapChat is for cheaters"),
        FiresideChatModel(topic: "Twitter is better than Instagram"),
        FiresideChatModel(topic: "Taylor Swiftie fans are overrated"),
        FiresideChatModel(topic: "Detroit rappers are overrated"),
        FiresideChatModel(topic: "The gamecube is the best nintendo console")
    ]
}
