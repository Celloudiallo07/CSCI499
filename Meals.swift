//
//  Meals.swift
//  Model Generated using http://www.jsoncafe.com/ 

import Foundation

struct Meals : Codable {

        let meals : [Meal]?

        enum CodingKeys: String, CodingKey {
                case meals = "meals"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                meals = try values.decodeIfPresent([Meal].self, forKey: .meals)
        }

}
