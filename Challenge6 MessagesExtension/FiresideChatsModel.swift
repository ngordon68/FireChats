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
    
    let demoArray:[String] = [
       "Dogs are better pets than cats" ,
       "The Lion King is overrated",
        "Apple juice is better than orange juice",
         "Lebron James is better than Michael Jordan",
            "Flats are better than drums"
    
    
    ]
    
    let fireChatPrompts:[FiresideChatModel] = [
        
        FiresideChatModel(topic: "Apple is better than Android"),
        FiresideChatModel(topic: "Dogs are better pets than cats" ),
        FiresideChatModel(topic: "Downtown Chicago is better than Downtown Detroit"),
        FiresideChatModel(topic: "The Lion King is overrated"),
        FiresideChatModel(topic: "Floyd Mayweather is the best boxer of all time"),
        FiresideChatModel(topic: "Buffalo sauce is better than BBQ sauce"),
      
        FiresideChatModel(topic: "Apple juice is better than orange juice"),
        FiresideChatModel(topic: "Cake is better than pie"),
        FiresideChatModel(topic: "Eastside is better than Westside"),
        FiresideChatModel(topic: "Anita Baker is better than Aretha Franklin"),
        FiresideChatModel(topic: "Lebron James is better than Michael Jordan"),
        FiresideChatModel(topic: "Flats are better than drums"),
        FiresideChatModel(topic: "Brandy is better than Monica"),
        FiresideChatModel(topic: "Spartans are better than Wolverines"),
        FiresideChatModel(topic: "Mac is better than Windows"),
        FiresideChatModel(topic: "BMF is better than Power"),
        FiresideChatModel(topic: "DC is better than Marvel"),
       
        FiresideChatModel(topic: "Hotdogs are sandwiches"),
        FiresideChatModel(topic: "Boneless wings are better than bone-in"),
        FiresideChatModel(topic: "Wendy's is better than McDonald's"),
        FiresideChatModel(topic: "Waffles are more popular than pancakes"),
        FiresideChatModel(topic: "Fall is the best season"),
        FiresideChatModel(topic: "Everyone should travel alone at least once in their life"),
        FiresideChatModel(topic: "Pepsi is a better product than Coke"),
        FiresideChatModel(topic: "Xbox has better games than PlayStation"),
        FiresideChatModel(topic: "Pie is a better dessert than cake"),
        FiresideChatModel(topic: "Hot sandwiches are better than cold sandwiches"),
        FiresideChatModel(topic: "Smooth peanut butter is better than crunchy"),
        FiresideChatModel(topic: "Hard shell tacos are better than soft shell"),
        FiresideChatModel(topic: "SnapChat is for cheaters"),
        FiresideChatModel(topic: "Twitter is better than Instagram"),
        FiresideChatModel(topic: "Taylor Swift fans are annoying"),
        FiresideChatModel(topic: "Detroit rappers are overrated"),
        FiresideChatModel(topic: "The GameCube is the best Nintendo console"),
        FiresideChatModel(topic: "Spotify is better than Apple Music"),
        FiresideChatModel(topic: "RnB is the best genre of music"),
        FiresideChatModel(topic: "Andrew Garfield is the best Spider-Man"),
        FiresideChatModel(topic: "Hershey is the worst brand of chocolate"),
        FiresideChatModel(topic: "Soft cookies are better than hard cookies"),
        FiresideChatModel(topic: "Oreos are better than Chips-Ahoy"),
        FiresideChatModel(topic: "Cedar Point is better than Six Flags"),
        FiresideChatModel(topic: "Cartoon Network has better shows than Nickelodeon"),
        FiresideChatModel(topic: "Early birds are better than Night owls"),
        FiresideChatModel(topic: "It's better to be hot with no A/C than to be cold with no heat"),
        FiresideChatModel(topic: "Square pizza taste better than circle pizza"),
        FiresideChatModel(topic: "Prince has better music than Michael Jackson"),
        FiresideChatModel(topic: "Chicken Noodle Soup is better than Chili"),
        FiresideChatModel(topic: "Vernor's is better than Canadian Dry"),
        FiresideChatModel(topic: "Kendrick Lamar is the greatest rapper alive"),
        FiresideChatModel(topic: "Hats make people go bald"),
        FiresideChatModel(topic: "Team Jacob is better than team Edward")
        
    ]
    
    let spicyPrompts:[FiresideChatModel]  = [
    
    FiresideChatModel(topic: "Starbucks is overrated")
    
    
    
    
    
    
    
    
    ]
}
