//
//  ImageLoader.swift
//  PokeAppIos
//
//  Created by Przemyslaw Dabrowski on 20/03/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import Alamofire

class ImageLoader: ObservableObject{
    
    @Published var dataIsValid = false
    
    var data:Data?
    
    func load(url: String) {
        
        guard let imageURL = URL(string: url) else {
            fatalError("ImageURL is not correct!")
        }
        
        AF.request(imageURL).responseData{data in
            guard let data = data.data else{
                print("Photo cannot be loaded")
                return
            }
            
            print("Photo loaded: \(url)")
            self.data = data
            self.dataIsValid = true
        }
    }
}
