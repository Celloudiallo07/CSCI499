//
//  RecipeView.swift
//  Meal It
//
//  Created by user201339 on 8/3/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecipeView: View {
    @ObservedObject private var viewModel = RecipeViewModel()
    
    var body: some View {
        VStack(alignment:.leading){
            
                VStack{
                ForEach(viewModel.items ?? viewModel.placeholders, id:
                            \.idMeal) { item in
                    NavigationLink(
                        destination: RecipeDetailsView(item: item), label: {NewRecipesView(item: item)})
                  
                        }
        }
            
        .navigationBarHidden(true)
        .padding(.horizontal)
            }
        
        .onAppear{
           viewModel.getData()

    }
   
    }
    
struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        
        RecipeView()
    }
}
}
