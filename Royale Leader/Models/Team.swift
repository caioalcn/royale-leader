//
//  Team.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 07/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import Foundation

struct Team {
    let tag: String?
    let name: String?
    let crownsEarned: Int?
    let startTrophies: Int?
    let clan: Clan?
    let deckLink: String?
    let deck: [Card]? = []
    
    init(json: JSON) {
        tag = json["tag"] as? String
        name = json["name"] as? String
        crownsEarned = json["crownsEarned"] as? Int
        startTrophies = json["startTrophies"] as? Int
        if let c = json["clan"] as? JSON {
            clan = Clan(json: c)
        } else {
            clan = nil
        }
        deckLink = json["deckLink"] as? String
        if let d = json["deck"] as? [JSON] {
            for de in d {
                deck?.append(Card(json: de))
            }
        }
    }
}
