//
//  GetAllPokemonsUseCase.swift
//  PokeAppIos
//
//  Created by Przemysław.Dabrowski on 24/02/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation
import PromiseKit

struct GetAllPokemonsUseCase: UseCase {
    
    typealias Param = Args
    
    typealias Result = Array<PokemonUi>
    
    private let pokemonRepository: PokemonRepository
    
    init(pokemonRepository: PokemonRepository) {
        self.pokemonRepository = pokemonRepository
    }
    
    func execute(param: GetAllPokemonsUseCase.Args) -> Promise<Array<PokemonUi>> {
        return pokemonRepository.fetchPage(offset: param.offset, pageSize: param.pageSize)
        .map{ pokemons in
                return pokemons.map{pokemon in PokemonUi(id: pokemon.id, name: pokemon.name)}
        }
    }
    
    struct Args {
        let offset: Int
        let pageSize: Int
    }
}
