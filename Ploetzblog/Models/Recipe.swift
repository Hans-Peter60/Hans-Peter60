//
//  Recipe.swift
//  Ploetzblog
//
//  Created by Hans-Peter Müller on 03.10.21.
//

import Foundation

class Incredient: Identifiable, Decodable {
    var id:UUID?
    var name:String
    var weight:Int?
}

class Component: Identifiable, Decodable {
    var id:UUID?
    var name:String
    var incredients:[Incredient]
}

class Instruction: Identifiable, Decodable {
    var id:UUID?
    var description:String
    var duration:Int
//    var duration2:Date?
}

class Recipe: Identifiable, Decodable {
    
    // The id property is for the Identifiable protocol which we need to display these instances in a SwiftUI List
    var id:UUID?
    
    // These properties map to the properties in the JSON file
    var name:String
    var image:String
    var description:String
    var components:[Component]
    var instructions:[Instruction]
//    var tags:[String]
}
