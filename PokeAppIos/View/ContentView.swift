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
    
    init(pokemonListViewModel: PokemonListViewModel) {
        self.pokemonListViewModel = pokemonListViewModel
        pokemonListViewModel.loadPokemons()
            .done{pokemons in
                print(pokemons)
        }.catch{error in
                print(error)
        }
    }
    
    var body: some View {
        Text("Hello, World!")
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
