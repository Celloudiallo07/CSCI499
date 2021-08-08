//
//  SearchUIView.swift
//  Meal It
//
//  Created by user201339 on 8/4/21.
//

import SwiftUI
import SDWebImageSwiftUI


struct SearchUIView: View {
    @Environment(\.presentationMode) var presentation
    @ObservedObject private var viewModel = SearchViewModel()
    @Binding var search: String
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack {
                Spacer()
                //.padding(.horizontal)
                
                
                
                HStack {
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "arrow.backward.circle.fill")
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color.clear)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    })
                    Spacer()                                }
                .padding(.horizontal)
                
                HStack {
                    
                    
                
                    Text("Search result")
                        .font(.system(size: 29, weight: .bold))
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)
                
                if viewModel.items != nil {
                    VStack {
                        ForEach(viewModel.items ?? viewModel.placeholders, id: \.idMeal) { item in
                            NavigationLink(
                                destination: RecipeDetailsView(item: item),
                                label: {
                                    NewRecipesView(item: item)})
                        }
                    }
                }
                else {
                    Text("No results")
                        .font(.system(size: 21))
                        .foregroundColor(Color.black)
                        .padding(.top)
                }
                
                Spacer()
            }
        })
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            viewModel.fetchData(query: self.search)
        }
        .navigationBarHidden(true)
        .background(Image("background").resizable().ignoresSafeArea())
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchUIView(search: .constant("Salad"))
    }
}
