//
//  GetAllPokemonsUseCase.swift
//  PokeAppIos
//
//  Created by Przemysław.Dabrowski on 24/02/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation
import Combine
import Alamofire

struct GetAllPokemonsUseCase {
    
    private let pokemonRepository: PokemonRepository
    
    init(pokemonRepository: PokemonRepository) {
        self.pokemonRepository = pokemonRepository
    }
    
    func execute(param: GetAllPokemonsUseCase.Args) -> AnyPublisher<Array<PokemonUi>, AFError> {
        return pokemonRepository.fetchPage(offset: param.offset, pageSize: param.pageSize)
        .map{ pokemons in
            return pokemons.map{pokemon in PokemonUi(id: pokemon.id,
                                                     name: pokemon.name,
                                                     avatar: pokemon.sprites.frontDefault!)} //TODO: Create mapper
        }.eraseToAnyPublisher()
    }
    
    struct Args {
        let offset: Int
        let pageSize: Int
    }
}
