//
//  MovieRowViewModel.swift
//  MoviesApp
//
//  Created by Nikola Savic on 1.4.24.
//

import Foundation
import MoviesDomain

final class MovieRowViewModel: ViewModel {
    struct State: Equatable {
        var movie: MovieEntity
    }
    
    enum Action {
        case fetchDetails
        case itemTapped
    }
    
    @Published var state: State
    
    private let moviesUseCase: MoviesUseCaseProtocol
    private let itemTapped: (MovieEntity) -> Void
    
    init(movie: MovieEntity, moviesUseCase: MoviesUseCaseProtocol, itemTapped: @escaping(MovieEntity) -> Void) {
        self.state = State(movie: movie)
        self.moviesUseCase = moviesUseCase
        self.itemTapped = itemTapped
    }
    
    func dispatch(_ action: Action) {
        switch action {
        case .fetchDetails:
            Task { @MainActor [weak self] in
                guard let self else { return }
                let movie =  try? await moviesUseCase.getMovie(id: state.movie.id)
                guard let movie else { return }
                self.state.movie = movie
            }
        case .itemTapped:
            itemTapped(state.movie)
        }
    }
}
