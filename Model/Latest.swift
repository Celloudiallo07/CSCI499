//
//  Latest.swift
//  Model Generated using http://www.jsoncafe.com/ 

import Foundation

struct Latest : Codable {

        let meals : [LatestMeal]?

        enum CodingKeys: String, CodingKey {
                case meals = "meals"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                meals = try values.decodeIfPresent([LatestMeal].self, forKey: .meals)
        }

}
