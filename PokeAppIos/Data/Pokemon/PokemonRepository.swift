//
//  PokemonRepository.swift
//  PokeAppIos
//
//  Created by Przemyslaw Dabrowski on 06/03/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation
import PromiseKit

struct PokemonRepository {
    let networkSource: PokemonNetworkSource
    
    init(networkSource: PokemonNetworkSource) {
        self.networkSource = networkSource
    }
    
    func fetchAll() -> Promise<Array<Pokemon>> {
        return networkSource.fetchAll(pageSize: 25)
    }
}
