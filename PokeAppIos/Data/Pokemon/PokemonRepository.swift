//
//  PokemonRepository.swift
//  PokeAppIos
//
//  Created by Przemyslaw Dabrowski on 06/03/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation
import Combine
import Alamofire

struct PokemonRepository {
    private let networkSource: PokemonNetworkSource
    
    init(networkSource: PokemonNetworkSource) {
        self.networkSource = networkSource
    }
    
    func fetchPage(offset: Int = 0, pageSize: Int = 20) -> AnyPublisher<Array<Pokemon>, AFError> {
        return networkSource.fetchAll(offset: offset, pageSize: pageSize)
    }
}
