//
//  DataAssembly.swift
//  PokeAppIos
//
//  Created by Przemyslaw Dabrowski on 06/03/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation
import Swinject

class DataAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(PokemonNetworkSource.self) { r in return PokemonNetworkSource() }
        container.register(PokemonRepository.self){r in return PokemonRepository(networkSource: r.resolve(PokemonNetworkSource.self)!)}
    }
}
