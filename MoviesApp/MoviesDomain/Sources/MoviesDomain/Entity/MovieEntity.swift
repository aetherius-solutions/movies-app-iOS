//
//  MovieEntity.swift
//
//
//  Created by Nikola Savic on 1.4.24.
//

import Foundation

public struct MovieEntity: Equatable {
    public let id: Int
    public let posterPath: String?
    public let title: String?
    public let budget: Int?
    public let releaseDate: String?
    public let runtime: Int?
    public let genres: [GenreEntity]?
    public let voteAverage: Double?
    public let voteCount: Int?
    public let revenue: Int?
    public let overview: String?
    public let spokenLanguages: [SpokenLanguageEntity]?
    public let popularity: Double
    public let productionCompanies: [CompaniesEntity]?
    public let imdbId: String?

    public init(
        id: Int,
        posterPath: String?,
        title: String?,
        budget: Int?,
        releaseDate: String?,
        runtime: Int?,
        genres: [GenreEntity]?,
        voteAverage: Double?,
        voteCount: Int?,
        revenue: Int?,
        overview: String?,
        spokenLanguages: [SpokenLanguageEntity]?,
        popularity: Double,
        productionCompanies: [CompaniesEntity]?,
        imdbId: String?
    ) {
        self.id = id
        self.posterPath = posterPath
        self.title = title
        self.budget = budget
        self.releaseDate = releaseDate
        self.runtime = runtime
        self.genres = genres
        self.voteAverage = voteAverage
        self.voteCount = voteCount
        self.revenue = revenue
        self.overview = overview
        self.spokenLanguages = spokenLanguages
        self.popularity = popularity
        self.productionCompanies = productionCompanies
        self.imdbId = imdbId
    }
}
