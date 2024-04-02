//
//  MovieEntity+Mapping.swift
//
//
//  Created by Nikola Savic on 1.4.24.
//

import Foundation
import MoviesDomain
import Networking

extension MovieEntityDTO {
    func toMovieEntity() -> MovieEntity {
        return .init(
            id: id,
            posterPath: posterPath,
            title: title,
            budget: budget,
            releaseDate: releaseDate,
            runtime: runtime,
            genres: (genres ?? []).map { $0.toGenreEntity() },
            voteAverage: voteAverage,
            voteCount: voteCount,
            revenue: revenue,
            overview: overview,
            spokenLanguages: (spokenLanguages ?? []).map { $0.toSpokenLanguage()},
            popularity: popularity, 
            productionCompanies: (productionCompanies ?? []).map { $0.toCompaniesEntity() },
            imdbId: imdbId
        )
    }
}
