//
//  SpokenEnglishDTO.swift
//
//
//  Created by Nikola Savic on 1.4.24.
//

import Foundation

public struct SpokenLanguageDTO: Decodable {
    public let englishName: String
    
    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
    }
}
