//
//  MovieDetailsViewModel.swift
//  MoviesApp
//
//  Created by Nikola Savic on 1.4.24.
//

import Foundation
import MoviesDomain

final class MovieDetailsViewModel: ViewModel {
    struct State: Equatable {}
    
    enum Action {
        case dismiss
    }
    
    private let onDismiss: () -> Void
    
    let movie: MovieEntity
    
    init(
        movie: MovieEntity,
        onDismiss: @escaping () -> Void
    ) {
        self.movie = movie
        self.onDismiss = onDismiss
    }
    
    func dispatch(_ action: Action) {
        switch action {
        case .dismiss:
            onDismiss()
        }
    }
 }
