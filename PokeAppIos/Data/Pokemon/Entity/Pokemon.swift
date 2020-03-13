
import Foundation

class Pokemon: Decodable{
    let id: Int
    let name: String
    let baseExperience: Int
    let height: Int
    let isDefault:Bool
    let order: Int
    let weight:Int
    //    let abilities: Array<Ability>
    //    let forms: Array<Form>
    //    let sprites: Array<Sprite>
    //    let stats: Array<Stats>
    //    let types: Array<Type>
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.baseExperience = try container.decode(Int.self, forKey: .baseExperience)
        self.height = try container.decode(Int.self, forKey: .height)
        self.isDefault = try container.decode(Bool.self, forKey: .isDefault)
        self.order = try container.decode(Int.self, forKey: .order)
        self.weight = try container.decode(Int.self, forKey: .weight)
        //TODO: Handle child objects
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, height, order, weight
        case baseExperience = "base_experience"
        case isDefault = "is_default"
    }
    
    //    required init?(json: JSON) {
    //        let abilities: Array<JSON> = json["abilities"].arrayValue
    //        let forms: Array<JSON> = json["forms"].arrayValue
    //        let sprites: Array<JSON> = json["sprites"].arrayValue
    //        let stats: Array<JSON> = json["stats"].arrayValue
    //        let types: Array<JSON> = json["types"].arrayValue
    //        self.abilities = abilities.map{ Ability(json: $0)! }
    //        self.forms = forms.map{Form(json: $0)!}
    //        self.sprites = sprites.map{Sprite(json: $0)!}
    //        self.stats = stats.map{Stats(json: $0)!}
    //        self.types = types.map{Type(json: $0)!}
    //    }
}
