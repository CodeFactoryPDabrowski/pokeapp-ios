//
//  PokemonListViewModel.swift
//  PokeAppIos
//
//  Created by Przemysław.Dabrowski on 28/02/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation
import Combine
import Alamofire

class PokemonListViewModel: ObservableObject {
    @Published
    var pokemons: [PokemonUi] = []
    
    var cancellable: AnyCancellable? = nil
    
    private let getAllPokemonsUseCase: GetAllPokemonsUseCase
    
    init(getAllPokemonsUseCase: GetAllPokemonsUseCase){
        self.getAllPokemonsUseCase = getAllPokemonsUseCase
        cancellable = loadPokemons().sink (receiveCompletion: {error in print(error)},
                             receiveValue: {pokemons in self.pokemons = pokemons})
    }
    
    deinit {
        cancellable?.cancel()
        cancellable = nil
    }
    
    func loadPokemons()-> AnyPublisher<Array<PokemonUi>, AFError> {
        return getAllPokemonsUseCase.execute(param: GetAllPokemonsUseCase.Args(offset: 0, pageSize: 20))
    }
}
