//
//  PokemonNetworkSource.swift
//  PokeAppIos
//
//  Created by Przemyslaw Dabrowski on 06/03/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

struct PokemonNetworkSource {
    
    func fetchAll(pageSize:Int) -> Promise<Array<Pokemon>> {
        return Promise{seal in
            AF.request("https://pokeapi.co/api/v2/pokemon/")//TODO: Move to other class! What about errors?
                .validate()
                .responseDecodable(of: Pokemons.self){ (response) in
                    guard let pokemonsWrapper = response.value else {return}
                    print(pokemonsWrapper)
                    seal.fulfill(pokemonsWrapper.pokemons)
            }
        }
        
    }
}
