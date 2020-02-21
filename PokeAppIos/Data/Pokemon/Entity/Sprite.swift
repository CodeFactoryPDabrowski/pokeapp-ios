//
//  Sprite.swift
//  PokeAppIos
//
//  Created by Przemysław.Dabrowski on 20/02/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation
import SwiftyJSON

class Sprite: JsonMappable {
    let backFemale:String
    let backShineFemale:String
    let backDefault:String
    let frontFemale:String
    let frontShinyFemale:String
    let backShiny:String
    let frontDefault:String
    let frontShiny:String
    
    required init?(json: JSON) {
        self.backFemale = json["back_female"].stringValue
        self.backShineFemale = json["back_shiny_female"].stringValue
        self.backDefault = json["back_default"].stringValue
        self.frontFemale = json["front_female"].stringValue
        self.frontShinyFemale = json["front_shiny_female"].stringValue
        self.backShiny = json["back_shiny"].stringValue
        self.frontDefault = json["front_default"].stringValue
        self.frontShiny = json["front_shiny"].stringValue
    }
}
