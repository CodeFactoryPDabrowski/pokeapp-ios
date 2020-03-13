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
    
    func fetchAll(offset: Int, pageSize:Int) -> Promise<Array<Pokemon>> {
        fetchAllResUrls(offset: offset, pageSize: pageSize)
            .thenMap{ pokemonUrl in
                self.fetchForUrl(url: pokemonUrl.url)
            }
    }
    
    private func fetchAllResUrls(offset: Int, pageSize: Int) -> Promise<Array<PokemonUrl>>{
        return Promise<Array<PokemonUrl>>{seal in
            AF.request("\(AppUrl.baseUrl)pokemon/?limit=\(pageSize)&offset=\(offset)")
                       .validate()
                       .responseDecodable(of: Pokemons.self){ (response) in
                           guard let pokemonsUrls = response.value else { return }
                           seal.fulfill(pokemonsUrls.results)
                   }
        }
        
}
    
    private func fetchForUrl(url: String) -> Promise<Pokemon>{
        return Promise<Pokemon>{ seal in
                       print(url)
                       AF.request(url)
                           .validate()
                           .responseDecodable(of: Pokemon.self){ (response) in
                               guard let pokemon = response.value else { return }
                               print(pokemon.name)
                               seal.fulfill(pokemon)
                           }
                   }
    }
}
