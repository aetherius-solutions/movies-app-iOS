//
//  MoviesAppTests.swift
//  MoviesAppTests
//
//  Created by Nikola Savic on 29.3.24.
//

import XCTest
@testable import MoviesApp
import Dependencies
import MoviesDomain

final class MoviesAppTests: XCTestCase {
    func testOnAppear_shouldFetchData() async {
        let sut = makeSUT(
            moviesUseCase: MockMoviesUseCase(
                movies: [
                    .init(
                        id: 1,
                        posterPath: nil,
                        title: "Kung Fu Panda",
                        budget: 1000,
                        releaseDate: "23-05-2024",
                        runtime: 200,
                        genres: [.init(id: 1, name: "Comedy")],
                        voteAverage: 8.5,
                        voteCount: 450,
                        revenue: 2000,
                        overview: "This is a Kung Fu Panda movie",
                        spokenLanguages: [.init(englishName: "en_US")],
                        popularity: 2.5,
                        productionCompanies: [.init(id: 1, logoPath: nil)],
                        imdbId: "1111"
                    ),
                    .init(
                        id: 2,
                        posterPath: nil,
                        title: "Terminator 3",
                        budget: 1000,
                        releaseDate: "23-05-2020",
                        runtime: 200,
                        genres: [.init(id: 1, name: "Thriller")],
                        voteAverage: 8.5,
                        voteCount: 450,
                        revenue: 2000,
                        overview: "This is a Terminator movie",
                        spokenLanguages: [.init(englishName: "en_US")],
                        popularity: 3,
                        productionCompanies: [.init(id: 1, logoPath: nil)],
                        imdbId: "1112"
                    )
                ]
            )
        )

        sut.dispatch(.onAppear)
        sleep(1)
        XCTAssertEqual(sut.state.movies.count, 2)
    }

    func testOnSearch_shouldReturnCorrectData() async {
        let sut = makeSUT(
            moviesUseCase: MockMoviesUseCase(
                movies: [
                    .init(
                        id: 1,
                        posterPath: nil,
                        title: "Kung Fu Panda",
                        budget: 1000,
                        releaseDate: "23-05-2024",
                        runtime: 200,
                        genres: [.init(id: 1, name: "Comedy")],
                        voteAverage: 8.5,
                        voteCount: 450,
                        revenue: 2000,
                        overview: "This is a Kung Fu Panda movie",
                        spokenLanguages: [.init(englishName: "en_US")],
                        popularity: 2.5,
                        productionCompanies: [.init(id: 1, logoPath: nil)],
                        imdbId: "1111"
                    ),
                    .init(
                        id: 2,
                        posterPath: nil,
                        title: "Terminator 3",
                        budget: 1000,
                        releaseDate: "23-05-2020",
                        runtime: 200,
                        genres: [.init(id: 1, name: "Thriller")],
                        voteAverage: 8.5,
                        voteCount: 450,
                        revenue: 2000,
                        overview: "This is a Terminator movie",
                        spokenLanguages: [.init(englishName: "en_US")],
                        popularity: 3,
                        productionCompanies: [.init(id: 1, logoPath: nil)],
                        imdbId: "1112"
                    )
                ]
            )
        )

        sut.searchTerm = "Kung"
        sleep(1)
        XCTAssertEqual(sut.state.movies.count, 1)
    }

    private func makeSUT(
        moviesUseCase: some MoviesUseCaseProtocol = MockMoviesUseCase(),
        debounce: Int = 0
    ) -> MoviesListViewModel {
        withDependencies {
            $0.moviesUseCase = moviesUseCase
        } operation: {
            MoviesListViewModel(
                debounce: 0,
                onMovieTapped: {_ in}
            )
        }
    }
}

private struct MockMoviesUseCase: MoviesUseCaseProtocol {
    let movies: [MovieEntity]

    init(movies: [MovieEntity] = []) {
        self.movies = movies
    }

    func getMovies(page: Int, searchCriteria: String) async throws -> MoviesEntity {
        var moviesList = movies
        if !searchCriteria.isEmpty {
            moviesList = movies.filter { $0.title?.range(of: searchCriteria, options: .caseInsensitive) != nil }
        }
        return .init(page: 1, results: moviesList, total_pages: 1, total_results: 1)
    }
    
    func getMovie(id: Int) async throws -> MovieEntity {
        // It's in the tests, so we can use force unwrap here
        return movies.first!
    }
}
