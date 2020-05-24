//
//  ContentView.swift
//  PokeAppIos
//
//  Created by Przemyslaw Dabrowski on 13/02/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject
    private var pokemonListViewModel: PokemonListViewModel

    
    init(pokemonListViewModel: PokemonListViewModel) {
        self.pokemonListViewModel = pokemonListViewModel
    }
    
    var body: some View {
        NavigationView{
            GridView(pokemonListViewModel.pokemons, columns: 2){ poke in
                NavigationLink(destination: PokemonDetails()) {
                    PokemonItem(pokemon: poke)
                }.buttonStyle(PlainButtonStyle())
            }
                .navigationBarTitle("Pokemons", displayMode: .inline) //TODO: Move to resources?
        }
    }
}
