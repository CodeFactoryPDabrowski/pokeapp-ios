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
    
    func execute(param: GetAllPokemonsUseCase.Args) -> Promise<Array<Pokemon>> {
        return firstly{
            fetchAll()
        }
    }
    
    //TODO: Implement proper fetching of pokemons
    func fetchAll() -> Promise<Array<Pokemon>> {
        return Promise { seal in
            seal.fulfill([Pokemon]())
        }
    }
    
    struct Args {
        let pageSize: Int
    }
}
