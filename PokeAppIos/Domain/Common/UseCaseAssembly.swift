//
//  UseCaseAssembly.swift
//  PokeAppIos
//
//  Created by Przemysław.Dabrowski on 28/02/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation
import Swinject

class UseCaseAssembly : Assembly {
    
    func assemble(container: Container) {
        container.register(GetAllPokemonsUseCase.self) { r in return GetAllPokemonsUseCase(pokemonRepository: r.resolve(PokemonRepository.self)!) }
    }
}
