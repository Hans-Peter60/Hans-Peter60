//
//  ContentView.swift
//  Ploetzblog
//
//  Created by Hans-Peter Müller on 03.10.21.
//

import SwiftUI

struct ContentView: View {
    
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
                                .aspectRatio(contentMode: .fill)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
