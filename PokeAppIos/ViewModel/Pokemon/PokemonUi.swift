//
//  PokemonUIModel.swift
//  PokeAppIos
//
//  Created by Przemyslaw Dabrowski on 20/03/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation

class PokemonUi: ObservableObject, Identifiable {
    
    var id: Int
    
    @Published
    var name: String
    
    @Published
    var avatar: String
    
    init(id: Int, name: String, avatar: String) {
        self.id = id
        self.name = name
        self.avatar = avatar
    }
}
