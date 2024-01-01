//  Catergories.swift
//  Model Generated using http://www.jsoncafe.com/ 

import Foundation

struct Catergories : Codable {

        let meals : [CatergoriesMeal]?

        enum CodingKeys: String, CodingKey {
                case meals = "meals"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                meals = try values.decodeIfPresent([CatergoriesMeal].self, forKey: .meals)
        }
}
