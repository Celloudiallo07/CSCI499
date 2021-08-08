//
//  Recipe.swift
//  Meal It
//
//

import Foundation


struct Recipe: Codable, Identifiable {
    let id: String
    let image: String
    let ingredients : String
    let steps: String
    let title:String
    let isRecommended : Bool
    
}
