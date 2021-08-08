//
//  Meal.swift
//  Model Generated using http://www.jsoncafe.com/ 

import Foundation

struct Meal : Codable {

        let idMeal : String?
        let strMeal : String?
        let strMealThumb : String?

        enum CodingKeys: String, CodingKey {
                case idMeal = "idMeal"
                case strMeal = "strMeal"
                case strMealThumb = "strMealThumb"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                idMeal = try values.decodeIfPresent(String.self, forKey: .idMeal)
                strMeal = try values.decodeIfPresent(String.self, forKey: .strMeal)
                strMealThumb = try values.decodeIfPresent(String.self, forKey: .strMealThumb)
        }

}
