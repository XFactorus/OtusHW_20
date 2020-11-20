//
//  RMCharacter.swift
//  ServiceLocatorApp
//
//  Created by Vladyslav Pokryshka on 24.09.2020.
//

import Foundation
import RealmSwift

// MARK: - Result
public class RMCharacter: Object, Codable, Identifiable {
    @objc public dynamic var id: Int = 0
    @objc public dynamic var name: String = ""
    @objc public dynamic var status: String = ""
    @objc public dynamic var species: String = ""
    @objc public dynamic var type: String = ""
    @objc public dynamic var gender: String = ""
    @objc public dynamic var origin: RMLocation?
    @objc public dynamic var location: RMLocation?
    @objc public dynamic var image: String = ""
    var episode = List<String>()
    @objc public dynamic var url: String = ""
    @objc public dynamic var created: String = ""

    public override init() {}
    
    public static func getMockCharacter() -> RMCharacter {
        let character = RMCharacter()
        character.id = 1
        character.name = "Rick Sanchez"
        character.species = "Human"
        character.gender = "Male"
        character.image = "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
        return character
    }
}

// MARK: - Location
@objc public class RMLocation: Object, Codable {
    @objc dynamic var name: String = ""
    @objc dynamic var url: String = ""
}
