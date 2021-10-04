//
//  RecipeDetailView.swift
//  Ploetzblog
//
//  Created by Hans-Peter Müller on 03.10.21.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        
        ScrollView {
        
            VStack {
                HStack {
                    Image(recipe.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80.0, height: 80.0, alignment: .center)
                        .clipped()
                        .cornerRadius(5)
                    Text(recipe.name)
                        .font(.title)
                }
                .padding(.top, 1.0)
                Text(recipe.description)
                    .font(.footnote)
                    .padding(.horizontal)
                
                Divider()
                
                VStack(alignment: .leading) {

                    ForEach(0..<recipe.components.count, id:\.self) { i in
                        Text(recipe.components[i].name)
                            .font(.headline)
                            .padding(.top, 2.0)

                        VStack(alignment: .leading) {
                            ForEach(0..<recipe.components[i].incredients.count, id:\.self) { j in
                                
                                if recipe.components[i].incredients[j].weight > 0 {

                                    Text("- " + String(recipe.components[i].incredients[j].weight) + "g " + recipe.components[i].incredients[j].name)
                                } else {
                                    Text("- " + recipe.components[i].incredients[j].name)                                    
                                }
                            }
                        }
                    }
                }

                Divider()
                
                VStack(alignment: .leading) {
                    ForEach(0..<recipe.instructions.count, id:\.self) { k in
                        
                            Text(recipe.instructions[k].description)
                            .padding([.top, .leading, .trailing], 2.0)
                    }
                }
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
