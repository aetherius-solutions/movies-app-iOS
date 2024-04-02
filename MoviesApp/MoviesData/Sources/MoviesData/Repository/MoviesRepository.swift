//
//  MoviesRepository.swift
//
//
//  Created by Nikola Savic on 1.4.24.
//

import Foundation
import MoviesDomain
import Networking

public struct MoviesRepository: MoviesRepositoryProtocol {
    public static var newRepo: MoviesRepository {
        MoviesRepository(service: NetworkingService.shared)
    }
    
    private let service: NetworkingService
    
    init(service: NetworkingService) {
        self.service = service
    }
    
    public func getMovies(page: Int) async throws -> MoviesEntity {
        guard let request = MoviesListAPIRequest(
            authorization: .init(accessToken: APIConstants.apiKey, refreshToken: ""),
            page: page
        ).generateURLRequest() else {
            throw APIError.notFound
        }
        
        let movies: MoviesEntityDTO = try await service.send(request)
        return movies.toMoviesEntity()
    }
    
    public func getMovie(id: Int) async throws -> MovieEntity {
        guard let request = MovieDetailsAPIRequest(
            authorization: .init(accessToken: APIConstants.apiKey, refreshToken: ""),
            movieId: id
        ).generateURLRequest() else {
            throw APIError.notFound
        }
        
        let movie: MovieEntityDTO = try await service.send(request)
        return movie.toMovieEntity()
    }
    
    public func getSearchedMovies(page: Int, searchCriteria: String) async throws -> MoviesEntity {
        guard let request = SearchMovieAPIRequest(
            authorization: .init(accessToken: APIConstants.apiKey, refreshToken: ""),
            page: page,
            searchCriteria: searchCriteria
        ).generateURLRequest() else {
            throw APIError.notFound
        }
        
        let movies: MoviesEntityDTO = try await service.send(request)
        return movies.toMoviesEntity()
    }
}
