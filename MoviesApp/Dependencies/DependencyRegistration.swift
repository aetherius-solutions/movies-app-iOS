//
//  DependencyRegistration.swift
//  MoviesApp
//
//  Created by Nikola Savic on 1.4.24.
//

import Foundation
import Dependencies
import MoviesDomain
import MoviesData

enum MoviesUseCaseKey: DependencyKey {
    public static var liveValue: any MoviesUseCaseProtocol {
        MoviesUseCase(repo: MoviesRepository.newRepo)
    }
}

extension DependencyValues {
    var moviesUseCase: MoviesUseCaseProtocol {
        get { self[MoviesUseCaseKey.self] }
        set { self[MoviesUseCaseKey.self] = newValue }
    }
}
