//
//  Sprite.swift
//  PokeAppIos
//
//  Created by Przemysław.Dabrowski on 20/02/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation

class Sprite: Decodable {
    let backFemale:String?
    let backShineFemale:String?
    let backDefault:String?
    let frontFemale:String?
    let frontShinyFemale:String?
    let backShiny:String?
    let frontDefault:String?
    let frontShiny:String?
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.backFemale = try container.decode(String?.self, forKey: .backFemale)
        self.backShineFemale = try container.decode(String?.self, forKey: .backShineFemale)
        self.backDefault = try container.decode(String?.self, forKey: .backDefault)
        self.frontFemale = try container.decode(String?.self, forKey: .frontFemale)
        self.frontShinyFemale = try container.decode(String?.self, forKey: .frontShinyFemale)
        self.backShiny = try container.decode(String?.self, forKey: .backShiny)
        self.frontDefault = try container.decode(String?.self, forKey: .frontDefault)
        self.frontShiny = try container.decode(String?.self, forKey: .frontShiny)
    }
          
    enum CodingKeys: String, CodingKey {
        case backFemale = "back_female"
        case backShineFemale = "back_shiny_female"
        case backDefault = "back_default"
        case frontFemale = "front_female"
        case frontShinyFemale = "front_shiny_female"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}
