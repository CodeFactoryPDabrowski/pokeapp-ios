//
//  ViewAssembly.swift
//  PokeAppIos
//
//  Created by Przemysław.Dabrowski on 28/02/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation
import Swinject

class ViewAssembly: Assembly {
    
    func assemble(container: Container) {
        //PokemonList
        container.register(ContentView.self) { r in
            return ContentView(pokemonListViewModel: r.resolve(PokemonListViewModel.self)!) }
    }
}
