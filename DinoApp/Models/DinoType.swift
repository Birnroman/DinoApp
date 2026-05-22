
enum DinoType: String, Codable {
    case predator = "Хищник"
    case herbivore = "Травоядный"
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawString = try container.decode(String.self)
        
        switch rawString {
        case "predator":
            self = .predator
        case "herbivore":
            self = .herbivore
        default:
            self = .herbivore
        }
    }
}
