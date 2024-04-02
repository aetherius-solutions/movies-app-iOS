//
//  MoviesEntity+Mapping.swift
//
//
//  Created by Nikola Savic on 1.4.24.
//

import Foundation
import MoviesDomain
import Networking

extension MoviesEntityDTO {
    func toMoviesEntity() -> MoviesEntity {
        return .init(
            page: page,
            results: (results ?? []).map { $0.toMovieEntity() },
            total_pages: total_pages,
            total_results: total_results
        )
    }
}
