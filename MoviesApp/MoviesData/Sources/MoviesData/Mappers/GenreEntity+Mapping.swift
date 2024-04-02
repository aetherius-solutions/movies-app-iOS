//
//  GenreEntityDTO.swift
//  
//
//  Created by Nikola Savic on 1.4.24.
//

import Foundation
import MoviesDomain
import Networking

extension GenreEntityDTO {
    func toGenreEntity() -> GenreEntity{
        return .init(
            id: id,
            name: name
        )
    }
}
