//
//  MoviesRepositoryProtocol.swift
//
//
//  Created by Nikola Savic on 1.4.24.
//

import UIKit

public protocol MoviesRepositoryProtocol: RepositoryProtocol {
    func getMovies(page: Int) async throws -> MoviesEntity
    func getMovie(id: Int) async throws -> MovieEntity
    func getSearchedMovies(page: Int, searchCriteria: String) async throws -> MoviesEntity
}
