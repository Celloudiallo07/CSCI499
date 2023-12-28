//  RecipeViewModel.swift
//  Meal It
//  Created by user201339 on 8/2/21.


import Foundation
import SwiftUI

class RecipeViewModel: ObservableObject {
    @Published var items: [Dish]?
    public var placeholders = Array(repeating: Dish(), count: 10)
    
    func getData() {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?f=a") else { return }
        
        //let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let search = try decoder.decode(Search.self, from: data)
                    DispatchQueue.main.async {
                        self.items = search.meals
                        print(search)
                        return
                    }
                }
                catch {
                    print(error)
                    return
                }
            }
        }.resume()
    }
}

struct RecipeViewModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

