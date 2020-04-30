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
        VStack(spacing: 0){
                Text(pokemon.name).background(Color.red)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                    .padding([.leading, .top, .trailing], 8)
            HStack{
                VStack{
                    Text("Grass")
                    Text("Fire")
                }.padding([.bottom, .leading], 8)
                UrlImage(url: pokemon.avatar).background(Color.yellow)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 72, alignment: .bottomTrailing)
                .padding([.bottom, .trailing], 8)
            }.background(Color.green)
            }
             .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
             .background(Color.blue)// TODO: Color should be different
             .cornerRadius(10)
              .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
            )
       
        }
}
