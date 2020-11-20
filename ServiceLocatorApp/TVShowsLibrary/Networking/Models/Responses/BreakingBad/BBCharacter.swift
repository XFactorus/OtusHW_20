import Foundation
import RealmSwift

public class BBCharacter: Object, Codable, Identifiable {
    public var id: Int
    public var name: String
    public var birthday: String?
    public var occupation: [String]?
    public var img: String?
    public var status, nickname: String?
    public var appearance: [Int]?
    public var portrayed, category: String?
    public var betterCallSaulAppearance: [Int]?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "char_id"
        case name, birthday, occupation, img, status, nickname, appearance, portrayed, category
        case betterCallSaulAppearance = "better_call_saul_appearance"
    }
    
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    public static func getMockCharacter() -> BBCharacter {
        let character = BBCharacter(id: 1, name: "Walter White")
        character.birthday = "09-07-1958"
        character.img = "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg"
        character.nickname = "Heisenberg"
        return character
    }
    
}


