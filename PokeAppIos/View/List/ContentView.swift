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
                ForEach(pokemonListUi.pokemons){ pokemonUi in
                    PokemonItem(pokemon: pokemonUi)
                }
                }.listSeparatorStyleNone()
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

public struct ListSeparatorStyleNoneModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content.onAppear {
            UITableView.appearance().separatorStyle = .none
        }.onDisappear {
            UITableView.appearance().separatorStyle = .singleLine
        }
    }
}

extension View {
    public func listSeparatorStyleNone() -> some View {
        modifier(ListSeparatorStyleNoneModifier())
    }
}
