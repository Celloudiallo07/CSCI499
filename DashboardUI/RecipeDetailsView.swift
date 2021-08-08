//
//  RecipeDetailsView.swift
//  Meal It
//
//  Created by user201339 on 8/3/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecipeDetailsView: View {
    var item: Dish
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content:{
            VStack{
                ZStack{
                    WebImage(url: URL(string: item.strMealThumb ?? "Loading..."))
                        .resizable()
                        .foregroundColor(.gray)
                        .redacted(reason: item.strMealThumb == nil ? .placeholder : .init())
                        .frame(width: UIScreen.main.bounds.width, height:
                            UIScreen.main.bounds.width)
                        .overlay(
                            ZStack {
                                VStack {
                                    HStack {
                                        Button(action: {
                                            presentation.wrappedValue.dismiss()
                                        }, label: {
                                            Image(systemName: "arrow.backward.circle.fill")
                                                .foregroundColor(Color.white)
                                                .padding()
                                                .background(Color.clear)
                                                .clipShape(Circle())
                                        })
                                        
                                        Spacer()
                                        
                                    }
                                    .padding(.horizontal)
                                    
                                    Spacer()
                                }
                                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                                Spacer()
                                
                                .frame(width: 80, height: 80)
                            }
                        )
                    
                }
                
                VStack {
                    VStack {
                        Capsule()
                            .frame(width: 80, height: 4)
                            .foregroundColor(Color.black.opacity(0.3))
                            .padding(.top)
                        
                        HStack {
                            Text(item.strCategory ?? "Loading...")
                                .font(.system(size: 15))
                                .fontWeight(.bold)
                                .textCase(.uppercase)
                                .foregroundColor(.white)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.gray.opacity(0.50))
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Text(item.strMeal ?? "Loading...")
                                .font(.system(size: 29, weight: .semibold))
                            
                            Spacer()
                        }
                        //.padding(.horizontal)
                        
                        .foregroundColor(.black)
                        .padding(.top, 4)
                        .padding(.horizontal)
                                            
                        .padding(.vertical)
                        .padding(.horizontal)
                    }
                    .background(Image("background").resizable())
                                
                    VStack {
                        HStack {
                            Text("Ingredients")
                                .font(.system(size: 23, weight: .bold))
                            
                            Spacer()
                            
                            Text("1 serving")
                                .fontWeight(.semibold)
                                .foregroundColor(Color.black)
                        }
                        .padding(.vertical)
                        .padding(.horizontal)
                        
                        ForEach(0..<10) { i in
                            if item["strIngredient\(i)"] != nil && item["strIngredient\(i)"] != "" {
                                VStack {
                                    HStack {
                                        Text(item["strIngredient\(i)"] ?? "Loading...")
                                        
                                        Spacer()
                                        
                                        Text(item["strMeasure\(i)"] ?? "Loading...")
                                            .fontWeight(.bold)
                                        
                                    }
                                    .padding(.vertical)
                                    
                                    Divider()
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                    .background(Image("background").resizable()
                                )
                    
                    VStack {
                        HStack {
                            Text("Instructions")
                                .font(.system(size: 23, weight: .bold))
                            
                            Spacer()
                        }
                        .padding(.vertical)
                        .padding(.horizontal)
                        
                       // ForEach(0..<10) { i in
                            //if item["strInstructions"] != nil && item["strInstructions\(i)"] != "" {
                                VStack {
                                    HStack {
                                        Text(item["strInstructions"] ?? "Loading...")
                                        
                                        Spacer()
                                    }
                                    .padding(.vertical)
                                    
                                    Divider()
                    
                                }
                                .padding(.horizontal)
                            
                                
                        
                    }
                    .background(Image("background").resizable()
                        .edgesIgnoringSafeArea([.bottom]))
                }
                .background(Color.gray.opacity(0.3))
                .cornerRadius(30)
                .offset(y: -30)
            }
        })
        .navigationBarHidden(true)
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct RecipeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailsView(item: items[0])
    }
}
    
