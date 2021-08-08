//
//  NewRecipeView.swift
//  Meal It
//
//  Created by user201339 on 8/4/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewRecipesView: View{
        var item: Dish
        
        var body: some View {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(item.strMeal ?? "Loading...")
                        .font(.system(size: 19, weight: .bold))
                        .foregroundColor(Color.black)
                        .redacted(reason: item.strMeal == nil ? .placeholder : .init())
                    
                    //Spacer()
                    
                    Text(item.strCategory ?? "Loading...")
                        .font(.system(size: 19, weight: .bold))
                        .foregroundColor(.gray)
                        .redacted(reason: item.strCategory == nil ? .placeholder : .init())
                }
                
                .padding(.top)
                .padding(.leading)
                
                Spacer()
                
                ZStack(alignment: .topTrailing) {
                    WebImage(url: URL(string: item.strMealThumb ?? "Loading..."))
                        .resizable()
                        .foregroundColor(.gray)
                        .redacted(reason: item.strMealThumb == nil ? .placeholder : .init())
                        .frame(width: 100, height: 100)
                    
            
                    .padding(6)
                    
                    .background(Color.black.opacity(0.4))
                
                    .padding(6)
                    
                }
                
            }
            
            .navigationBarHidden(true)
            .frame(width: UIScreen.main.bounds.width - 30)
            .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.black.opacity(0.3), lineWidth: 1))
            
        }
    
    }


struct NewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
