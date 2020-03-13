//
//  Pokemons.swift
//  PokeAppIos
//
//  Created by Przemyslaw Dabrowski on 06/03/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation

class Pokemons: Decodable {
    let results: Array<PokemonUrl>
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try container.decode(Array<PokemonUrl>.self, forKey: .results)
    }
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

class PokemonUrl: Decodable {
    let url: String
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url =  try container.decode(String.self, forKey: .url)
    }
    
    enum CodingKeys: String, CodingKey {
        case url
    }
}
