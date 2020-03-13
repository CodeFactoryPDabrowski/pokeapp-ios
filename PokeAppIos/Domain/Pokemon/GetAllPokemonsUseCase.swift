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
    
    typealias Result = Array<Pokemon>
    
    private let pokemonRepository: PokemonRepository
    
    init(pokemonRepository: PokemonRepository) {
        self.pokemonRepository = pokemonRepository
    }
    
    func execute(param: GetAllPokemonsUseCase.Args) -> Promise<Array<Pokemon>> {
        return firstly{
            pokemonRepository.fetchAll()
        }
    }
    
    struct Args {
        let pageSize: Int
    }
}
