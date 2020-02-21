
import Foundation
import SwiftyJSON

class Pokemon: JsonMappable{
    
    let id: Int
    let name: String
    let baseExperience: Int
    let height: Int
    let isDefault:Bool
    let order: Int
    let weight:Int
    let abilities: Array<Ability>
    let forms: Array<Form>
    let sprites: Array<Sprite>
    let stats: Array<Stats>
    let types: Array<Type>
    
    required init?(json: JSON) {
        let abilities: Array<JSON> = json["abilities"].arrayValue
        let forms: Array<JSON> = json["forms"].arrayValue
        let sprites: Array<JSON> = json["sprites"].arrayValue
        let stats: Array<JSON> = json["stats"].arrayValue
        let types: Array<JSON> = json["types"].arrayValue
        
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.baseExperience = json["base_experience"].intValue
        self.height = json["height"].intValue
        self.isDefault = json["is_default"].boolValue
        self.order = json["order"].intValue
        self.weight = json["weight"].intValue
        self.abilities = abilities.map{ Ability(json: $0)! }
        self.forms = forms.map{Form(json: $0)!}
        self.sprites = sprites.map{Sprite(json: $0)!}
        self.stats = stats.map{Stats(json: $0)!}
        self.types = types.map{Type(json: $0)!}
    }
}
