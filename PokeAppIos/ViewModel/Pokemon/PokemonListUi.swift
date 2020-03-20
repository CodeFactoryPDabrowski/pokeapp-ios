//
//  PokemonsModel.swift
//  PokeAppIos
//
//  Created by Przemyslaw Dabrowski on 20/03/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation

class PokemonListUi: ObservableObject {
    @Published
    var pokemons: [PokemonUi] = []
}
