//
//  Recipe.swift
//  Ploetzblog
//
//  Created by Hans-Peter Müller on 03.10.21.
//

import Foundation

struct Incredient: Decodable {
    var name:String
    var weight:Int
}

struct Component: Decodable {
    var name:String
    var incredients:[Incredient]
}

struct Instruction: Decodable {
    var description:String
    var duration:Int
//    var duration2:Date?
}

struct Recipe: Identifiable, Decodable {
    
    // The id property is for the Identifiable protocol which we need to display these instances in a SwiftUI List
    var id:UUID?
    
    // These properties map to the properties in the JSON file
    var name:String
    var image:String
    var description:String
    var components: [Component]
    var instructions: [Instruction]
//    var tags:[String]
}
