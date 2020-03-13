//
//  Pokemons.swift
//  PokeAppIos
//
//  Created by Przemyslaw Dabrowski on 06/03/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation

class Pokemons: Decodable {
    let pokemons: Array<Pokemon>
    
    required init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
          var pokemons = Array<Pokemon>()
          while !container.isAtEnd {
            let pokemon = try container.decode(Pokemon.self)
            pokemons.append(pokemon)
          }
        self.pokemons = pokemons
    }
}
