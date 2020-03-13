//
//  Type.swift
//  PokeAppIos
//
//  Created by Przemysław.Dabrowski on 20/02/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation

class Type: Decodable, ResourceField{
    let slot: Int
    let name: String
    let url: String
    
    required init(from decoder: Decoder) throws {
           let container = try decoder.container(keyedBy: CodingKeys.self)
           self.slot = try container.decode(Int.self, forKey: .slot)
           let type =  try container.decode(TypeNested.self, forKey: .type)
           self.name = type.name
           self.url = type.url
    }
       
    enum CodingKeys: String, CodingKey {
        case slot, type
    }
}

class TypeNested: Decodable, ResourceField {
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
