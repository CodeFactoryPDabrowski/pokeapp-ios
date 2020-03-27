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
            List{
                ForEach(pokemonListUi.pokemons){ pokemon in
                    HStack{
                        UrlImage(url: pokemon.avatar)
                        Text("Pokemon: \(pokemon.name)")
                    }
                }
            }
            .navigationBarTitle("Pokemons") //TODO: Move to resources?
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

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
