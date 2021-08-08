//
//  Meal.swift
//  Model Generated using http://www.jsoncafe.com/ 

import Foundation

struct CatergoriesMeal : Codable {

        let strCategory : String?

        enum CodingKeys: String, CodingKey {
                case strCategory = "strCategory"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                strCategory = try values.decodeIfPresent(String.self, forKey: .strCategory)
        }

}
