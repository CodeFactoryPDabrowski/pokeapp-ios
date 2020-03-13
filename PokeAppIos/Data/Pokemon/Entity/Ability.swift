//
//  Ability.swift
//  PokeAppIos
//
//  Created by Przemysław.Dabrowski on 20/02/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation

class Ability: Decodable, ResourceField{
    let isHidden: Bool
    let slot: Int
    let name: String
    let url: String
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isHidden = try container.decode(Bool.self, forKey: .isHidden)
        self.slot = try container.decode(Int.self, forKey: .slot)
        let ability =  try container.decode(AbilityNested.self, forKey: .ability)
        self.name = ability.name
        self.url = ability.url
    }
    
    enum CodingKeys: String, CodingKey {
        case slot, ability
        case isHidden = "is_hidden"
    }
}

class AbilityNested: Decodable, ResourceField {
    let name: String
    let url: String
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.url = try container.decode(String.self, forKey: .url)
       }
       
       enum CodingKeys: String, CodingKey {
           case name, url
       }
}
