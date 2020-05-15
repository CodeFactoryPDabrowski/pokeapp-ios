//
//  PokemonListViewModel.swift
//  PokeAppIos
//
//  Created by Przemysław.Dabrowski on 28/02/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation
import PromiseKit

class PokemonListViewModel: ObservableObject {
    @Published
    var pokemons: [PokemonUi] = []
    
    private let getAllPokemonsUseCase: GetAllPokemonsUseCase
    
    init(getAllPokemonsUseCase: GetAllPokemonsUseCase){
        self.getAllPokemonsUseCase = getAllPokemonsUseCase
        loadPokemons().done{pokemonsUi in
                self.pokemons = pokemonsUi
        }.catch{error in
                print(error)
        }
    }
    
    func loadPokemons()-> Promise<Array<PokemonUi>> {
        return getAllPokemonsUseCase.execute(param: GetAllPokemonsUseCase.Args(offset: 0, pageSize: 20))
    }
}
