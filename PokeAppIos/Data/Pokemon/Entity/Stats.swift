//
//  Stats.swift
//  PokeAppIos
//
//  Created by Przemysław.Dabrowski on 20/02/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation

class Stats: Decodable, ResourceField{
    let baseStat:Int
    let effort:Int
    let name: String
    let url: String
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.baseStat = try container.decode(Int.self, forKey: .baseStat)
        self.effort = try container.decode(Int.self, forKey: .effort)
        let stat =  try container.decode(Stat.self, forKey: .stat)
        self.name = stat.name
        self.url = stat.url
    }
    
    enum CodingKeys: String, CodingKey {
        case effort, stat
        case baseStat = "base_stat"
    }
}

class Stat: Decodable, ResourceField {
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
