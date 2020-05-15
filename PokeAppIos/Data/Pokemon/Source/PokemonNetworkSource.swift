//
//  PokemonNetworkSource.swift
//  PokeAppIos
//
//  Created by Przemyslaw Dabrowski on 06/03/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation
import Alamofire
import Combine

struct PokemonNetworkSource {
    
    func fetchAll(offset: Int, pageSize:Int) -> AnyPublisher<Array<Pokemon>, AFError>{
        return fetchAllResUrls(offset: offset, pageSize: pageSize)
            .flatMap {pokemonUrls in self.fetchForUrlsAll(urls: pokemonUrls.map{$0.url})}
            .eraseToAnyPublisher()
    }
    
     private func fetchAllResUrls(offset: Int, pageSize: Int) -> AnyPublisher<Array<PokemonUrl>, AFError>{
            return Deferred{
                       Future{promise in
                           AF.request("\(AppUrl.baseUrl)pokemon/?limit=\(pageSize)&offset=\(offset)")
                           .validate()
                           .responseDecodable(of: Pokemons.self){ (response) in
                               guard let pokemonsUrls = response.value else { return }
                            promise(.success(pokemonsUrls.results)) //TODO: Handling errors
                       }}
                       }.eraseToAnyPublisher()
            
    }
    private func fetchForUrlsAll(urls: Array<String>) -> AnyPublisher<Array<Pokemon>, AFError>{
        return Publishers.Sequence(sequence: urls)
            .flatMap {self.fetchForUrl(url: $0)}
            .collect()
            .eraseToAnyPublisher()
    }
    
    private func fetchForUrl(url: String) -> AnyPublisher<Pokemon, AFError>{
            return Deferred{ Future{promise in
                           print(url)
                           AF.request(url)
                               .validate()
                               .responseDecodable(of: Pokemon.self){ (response) in
                                   guard let pokemon = response.value else { return }
                                   print(pokemon.name)
                                promise(.success(pokemon))
                               }
                }}.eraseToAnyPublisher()
        }
}
