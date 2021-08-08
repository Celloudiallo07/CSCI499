//
//  SwiftUIView.swift
//  Meal It
//
//  Created by user201339 on 8/4/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    @State var search: String = ""
    @State var selectedIndex = 0
    @Namespace var animation
    @State var showSearchResult = false
    

    
    var body: some View {
        
        NavigationView {
            
            ScrollView(.vertical, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
                VStack(alignment:.leading){
                    Divider()
                    .padding(.top, 8)
                    
                    Text("Welcome! What do you want \nto cook today?")
                        .font(.system(size: 26, weight: .semibold))
                        .padding(.top, 30)
                        .padding(.leading)
                    
                    HStack(spacing: 15) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 27, weight: .bold))
                            .foregroundColor(.white)
                        
                        TextField("Search for a new meal!",
                                  text: $search,
                                  onEditingChanged: { edit in
                                    print("edit = \(edit)")
                                  },
                                  onCommit: {
                                    showSearchResult = true
                                  })
                            .font(.system(size: 21))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray.opacity(0.3), lineWidth: 1))
                    .padding(.top)
                    .padding(.horizontal)
                    //.navigationBarHidden(true)
                
                NavigationLink(destination: SearchUIView(search: $search), isActive: $showSearchResult) {
                        EmptyView()
                    }
        
                        .hidden()
            
                    
                    RecipeView()
                    .padding(.top)
                    
                    Spacer()
                }
            })
        .background(Image("background").resizable()
            .scaledToFill()
            .clipped())
            .edgesIgnoringSafeArea([.all])
            
        }
            
            .navigationBarTitle(Text("x"))
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .ignoresSafeArea(.all, edges: .all)
                    

    }


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
}

