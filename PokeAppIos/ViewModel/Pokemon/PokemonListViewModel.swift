//
//  PokemonListViewModel.swift
//  PokeAppIos
//
//  Created by Przemysław.Dabrowski on 28/02/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation
import PromiseKit

class PokemonListViewModel {
    let getAllPokemonsUseCase: GetAllPokemonsUseCase
    
    init(getAllPokemonsUseCase: GetAllPokemonsUseCase){
        self.getAllPokemonsUseCase = getAllPokemonsUseCase
    }
    
    func loadPokemons()-> Promise<Array<Pokemon>> {
        return getAllPokemonsUseCase.execute(param: GetAllPokemonsUseCase.Args(pageSize: 20))
    }
}
