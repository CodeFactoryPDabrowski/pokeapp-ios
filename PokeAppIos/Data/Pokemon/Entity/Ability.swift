//
//  Ability.swift
//  PokeAppIos
//
//  Created by Przemysław.Dabrowski on 20/02/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation
import SwiftyJSON

class Ability: JsonMappable, ResourceField{
    let isHidden: Bool
    let slot: Int
    let name: String
    let url: String
    
    required init?(json: JSON) {
        self.isHidden = json["is_hidden"].boolValue
        self.slot = json["slot"].intValue
        self.name = json["ability"]["name"].stringValue
        self.url = json["ability"]["url"].stringValue
    }
}
