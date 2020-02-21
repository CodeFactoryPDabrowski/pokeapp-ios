//
//  Type.swift
//  PokeAppIos
//
//  Created by Przemysław.Dabrowski on 20/02/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation
import SwiftyJSON

class Type: JsonMappable, ResourceField{
    let slot: Int
    let name: String
    let url: String
    
    required init?(json: JSON) {
        self.slot = json["slot"].int!
        self.name = json["type"]["name"].stringValue
        self.url = json["type"]["url"].stringValue
    }
}
