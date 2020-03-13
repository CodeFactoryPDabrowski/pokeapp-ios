
import Foundation

class Pokemon: Decodable{
    let id: Int
    let name: String
    let baseExperience: Int
    let height: Int
    let isDefault:Bool
    let order: Int
    let weight:Int
    let abilities: Array<Ability>
    let forms: Array<Form>
    let sprites: Sprite
    let species: Species
    let stats: Array<Stats>
    let types: Array<Type>
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.baseExperience = try container.decode(Int.self, forKey: .baseExperience)
        self.height = try container.decode(Int.self, forKey: .height)
        self.isDefault = try container.decode(Bool.self, forKey: .isDefault)
        self.order = try container.decode(Int.self, forKey: .order)
        self.weight = try container.decode(Int.self, forKey: .weight)
        self.abilities = try container.decode(Array<Ability>.self, forKey: .abilities)
        self.forms = try container.decode(Array<Form>.self, forKey: .forms)
        self.sprites = try container.decode(Sprite.self, forKey: .sprites)
        self.species = try container.decode(Species.self, forKey: .species)
        self.stats = try container.decode(Array<Stats>.self, forKey: .stats)
        self.types = try container.decode(Array<Type>.self, forKey: .types)
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, height, order, weight, abilities, forms, sprites, species, stats, types
        case baseExperience = "base_experience"
        case isDefault = "is_default"
    }
}
