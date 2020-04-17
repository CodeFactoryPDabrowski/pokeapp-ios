//
//  ContentView.swift
//  PokeAppIos
//
//  Created by Przemyslaw Dabrowski on 13/02/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    private let pokemonListViewModel: PokemonListViewModel
    
    @ObservedObject
    private var pokemonListUi: PokemonListUi = PokemonListUi()
    
    init(pokemonListViewModel: PokemonListViewModel) {
        self.pokemonListViewModel = pokemonListViewModel
    }
    
    var body: some View {
        NavigationView{
            GridView(pokemonListUi.pokemons, columns: 2){
                PokemonItem(pokemon: $0)
            }
                .navigationBarTitle("Pokemons", displayMode: .inline) //TODO: Move to resources?
            .onAppear(){
                self.pokemonListViewModel.loadPokemons()
                    .done{pokemonsUi in
                        self.pokemonListUi.pokemons = pokemonsUi
                }.catch{error in
                        print(error)
                }
            }
        }
    }
}
