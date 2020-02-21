//
//  Stats.swift
//  PokeAppIos
//
//  Created by Przemysław.Dabrowski on 20/02/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation
import SwiftyJSON

class Stats: JsonMappable, ResourceField{
    let baseStat:Int
    let effort:Int
    let name: String
    let url: String
    
    required init?(json: JSON) {
        self.baseStat = json["base_stat"].intValue
        self.effort = json["effort"].intValue
        self.name = json["stat"]["name"].stringValue
        self.url = json["stat"]["url"].stringValue
    }
    
}
