//
//  CharacterModel.swift
//  DragonBallApp
//
//  Created by sergio serrano on 25/7/22.
//

import Foundation


typealias CharactersModel = [CharacterModel]

struct CharacterModel {
    var image: String
    var name: String
    var lastname: String
    var score: Float = 0.0
}


let sampleCharactersData: CharactersModel = [
    CharacterModel(image: "Roshi",
                   name: "Maestro",
                   lastname: "Roshi",
                   score: 10.0),
    CharacterModel(image: "Mr Satán",
                   name: "Mr",
                   lastname: "Satán",
                   score: 9.8),
    CharacterModel(image: "Krilin",
                   name: "Krilin",
                   lastname: "",
                   score: 9.0),
    CharacterModel(image: "goku",
                   name: "Goku",
                   lastname: "",
                   score: 9.0),
    CharacterModel(image: "vegetita",
                   name: "Vegeta",
                   lastname: "",
                   score: 9.0),
    CharacterModel(image: "Bulma",
                   name: "Bulma",
                   lastname: "",
                   score: 9.0),

]
