//
//  SpokenLanguageDTO.swift
//  
//
//  Created by Nikola Savic on 1.4.24.
//

import Foundation
import MoviesDomain
import Networking

extension SpokenLanguageDTO {
    func toSpokenLanguage() -> SpokenLanguageEntity {
        return .init(
            englishName: englishName
        )
    }
}
