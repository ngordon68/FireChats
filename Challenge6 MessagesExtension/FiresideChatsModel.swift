//
//  FiresideChatsModel.swift
//  Challenge6 MessagesExtension
//
//  Created by Nick Gordon on 5/2/23.
//

import Foundation
import SwiftUI

struct FireChatModel {
    var id = UUID()
    var topic: String
}

class FireChats {
    let fireChatPrompts:[FireChatModel] = [
        FireChatModel(topic: "Apple is better than Android"),
        FireChatModel(topic: "Dogs are better pets than cats" ),
        FireChatModel(topic: "Downtown Chicago is better than Downtown Detroit"),
        FireChatModel(topic: "The Lion King is overrated"),
        FireChatModel(topic: "Floyd Mayweather is the best boxer of all time"),
        FireChatModel(topic: "Buffalo sauce is better than BBQ sauce"),
        FireChatModel(topic: "Apple juice is better than orange juice"),
        FireChatModel(topic: "Cake is better than pie"),
        FireChatModel(topic: "Peanuts does not belong in chocolate"),
        FireChatModel(topic: "Fall is the best season"),
        FireChatModel(topic: "Lebron James is better than Michael Jordan"),
        FireChatModel(topic: "Flats are better than drums"),
        FireChatModel(topic: "4 day work weeks should be the norm"),
        FireChatModel(topic: "Spartans are better than Wolverines"),
        FireChatModel(topic: "Mac is better than Windows"),
        FireChatModel(topic: "Online dating is overrated"),
        FireChatModel(topic: "DC is better than Marvel"),
        FireChatModel(topic: "Hotdogs are sandwiches"),
        FireChatModel(topic: "Boneless wings are better than bone-in"),
        FireChatModel(topic: "Wendy's is better than McDonald's"),
        FireChatModel(topic: "Waffles are more popular than pancakes"),
        FireChatModel(topic: "Fall is the best season"),
        FireChatModel(topic: "Everyone should travel alone at least once in their life"),
        FireChatModel(topic: "AI will eventually take over the world"),
        FireChatModel(topic: "Xbox has better games than PlayStation"),
        FireChatModel(topic: "Pie is a better dessert than cake"),
        FireChatModel(topic: "Hot sandwiches are better than cold sandwiches"),
        FireChatModel(topic: "Smooth peanut butter is better than crunchy"),
        FireChatModel(topic: "Hard shell tacos are better than soft shell"),
        FireChatModel(topic: "SnapChat is for cheaters"),
        FireChatModel(topic: "Twitter is better than Instagram"),
        FireChatModel(topic: "Taylor Swift fans are annoying"),
        FireChatModel(topic: "Detroit rappers are overrated"),
        FireChatModel(topic: "The GameCube is the best Nintendo console"),
        FireChatModel(topic: "Spotify is better than Apple Music"),
        FireChatModel(topic: "RnB is the best genre of music"),
        FireChatModel(topic: "Andrew Garfield is the best Spider-Man"),
        FireChatModel(topic: "Hershey is the worst brand of chocolate"),
        FireChatModel(topic: "Soft cookies are better than hard cookies"),
        FireChatModel(topic: "Oreos are better than Chips-Ahoy"),
        FireChatModel(topic: "Cedar Point is better than Six Flags"),
        FireChatModel(topic: "Cartoon Network has better shows than Nickelodeon"),
        FireChatModel(topic: "Early birds are better than Night owls"),
        FireChatModel(topic: "It's better to be hot with no A/C than to be cold with no "),
        FireChatModel(topic: "Square pizza taste better than circle pizza"),
        FireChatModel(topic: "Prince has better music than Michael Jackson"),
        FireChatModel(topic: "Chicken Noodle Soup is better than Chili"),
        FireChatModel(topic: "Vernor's is better than Canadian Dry"),
        FireChatModel(topic: "Kendrick Lamar is the greatest rapper alive"),
        FireChatModel(topic: "Hats make people go bald"),
        FireChatModel(topic: "Cereal is a soup")
        
    ]
    
    let spicyPrompts:[FireChatModel]  = [
    FireChatModel(topic: "Starbucks is overrated"),
    FireChatModel(topic: "Pumpkin spice is overrated"),
    FireChatModel(topic: "")
    ]
}
