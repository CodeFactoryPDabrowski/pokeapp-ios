//
//  PokemonItem.swift
//  PokeAppIos
//
//  Created by Przemyslaw Dabrowski on 27/03/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import SwiftUI

struct PokemonItem: View {
    private let pokemon: PokemonUi
    
    init(pokemon: PokemonUi) {
        self.pokemon = pokemon
    }
    
    var body: some View {
            HStack{
                UrlImage(url: pokemon.avatar)
                Text("Pokemon: \(pokemon.name)")
            }
             .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
             .background(Color.blue)// TODO: Color should be different
             .cornerRadius(10)
              .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
            )
       
        }
}
