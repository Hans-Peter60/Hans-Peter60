//
//  ContentView.swift
//  Ploetzblog
//
//  Created by Hans-Peter Müller on 03.10.21.
//

import SwiftUI

struct RecipeListView: View {
    
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        
         NavigationView {
        
            List(model.recipes) { r in
            
                NavigationLink(
                    destination: RecipeDetailView(recipe: r),
                    label: {
                        HStack {
                            Image(r.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50.0, height: 50.0, alignment: .center)
                                .clipped()
                                .cornerRadius(5)
                            Text(r.name)
                                .font(.headline)
                        }
                    }
                )
            }.navigationBarTitle("Alle Rezepte")
        }
    }
    
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
