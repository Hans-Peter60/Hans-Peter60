//
//  RecipeModel.swift
//  Ploetzblog
//
//  Created by Hans-Peter Müller on 03.10.21.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    var jsonRecipes = [Recipe]()

    init() {
        
        // Find the path to the JSON file in our bundle
        let pathString = Bundle.main.path(forResource: "Recipes", ofType: "json")
        
        if pathString != nil {
            
            // Create a URL object with the string path to our local JSON file
            let url = URL(fileURLWithPath: pathString!)
            
            do {
                // Create data object, pointing it to our local JSON file
                let data = try Data(contentsOf: url)
                
                let decoder = JSONDecoder()
                
                do {
                    // Try to decode the json data into instances of Recipes
                    jsonRecipes = try decoder.decode([Recipe].self, from: data)
                    
                    
                    // Loop through recipes and add Ids
                    for index in 0..<jsonRecipes.count {
                        jsonRecipes[index].id = UUID()
                    }
                    
                    // Assign to recipes property
                    self.recipes = jsonRecipes
                }
                catch {
                    print("Couldn't parse Recipes")
                }
                
            }
            catch {
                print("Couldn't create Data object")
            }
            
        }
    }
    
}
