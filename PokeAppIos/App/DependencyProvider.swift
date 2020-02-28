//
//  DependencyProvider.swift
//  PokeAppIos
//
//  Created by Przemysław.Dabrowski on 28/02/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation
import Swinject

class DependencyProvider{
    let container = Container()
    private let assembler: Assembler
    
    init() {
        assembler = Assembler(
            [
                UseCaseAssembly(),
                ViewModelAssembly(),
                ViewAssembly()
            ],
            container: container
        )
    }
}
