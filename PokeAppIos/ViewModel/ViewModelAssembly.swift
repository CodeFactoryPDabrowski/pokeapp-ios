//
//  ViewModelAssembly.swift
//  PokeAppIos
//
//  Created by Przemysław.Dabrowski on 28/02/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation
import Swinject

class ViewModelAssembly : Assembly {
    
    func assemble(container: Container) {
        //PokemonList
        container.register(PokemonListViewModel.self) { r in
            return PokemonListViewModel(getAllPokemonsUseCase: r.resolve(GetAllPokemonsUseCase.self)!) }
    }
}
