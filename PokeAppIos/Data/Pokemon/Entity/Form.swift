//
//  Form.swift
//  PokeAppIos
//
//  Created by Przemysław.Dabrowski on 20/02/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation
import SwiftyJSON

class Form: JsonMappable, ResourceField{
    let name: String
    let url: String
    
    required init?(json: JSON) {
        self.name = json["name"].stringValue
        self.url = json["url"].stringValue
    }
}
