//
//  SplashViewModel.swift
//  MoviesApp
//
//  Created by Nikola Savic on 29.3.24.
//

import Foundation
import Combine
import MoviesDomain
import Dependencies

final class MoviesListViewModel: ViewModel {
    struct State: Equatable {
        var movies: [MovieEntity] = []
        var lastTextValue = ""
        var isLoading = false
    }

    enum Action {
        case onAppear
        case search(String)
        case movieTapped(MovieEntity)
        case getMovies(String)
        case clearArray
        case clearSearchTerm
    }
    
    @Published var state = State()
    @Published var searchTerm = ""

    private var currentPage = 1
    private var cancellables = Set<AnyCancellable>()

    private let loadMorePagesOffset = 3
    private let debounce: Int
    private let onMovieTapped: (MovieEntity) -> Void

    @Dependency(\.moviesUseCase)
    var moviesUseCase

    init(
        debounce: Int = 1,
        onMovieTapped: @escaping (MovieEntity) -> Void
    ) {
        self.debounce = debounce
        self.onMovieTapped = onMovieTapped
        self.bindSearchTextListener()
    }

    private func bindSearchTextListener() {
        self.$searchTerm
            .debounce(for: .seconds(debounce), scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                self.dispatch(.search($0))
            })
            .store(in: &cancellables)
    }

    func dispatch(_ action: Action) {
        switch action {
        case .onAppear:
            dispatch(.getMovies(""))
        case .search(let term):
            if state.lastTextValue != term {
                state.lastTextValue = term
                dispatch(.clearArray)
                dispatch(.getMovies(term))
            }
        case .movieTapped(let movie):
            onMovieTapped(movie)
        case .getMovies(let searchTerm):
            Task { [weak self] in
                guard let self else { return }
                await fetchMovies(for: searchTerm)
            }
        case .clearArray:
            currentPage = 1
            state.movies = []
        case .clearSearchTerm:
            searchTerm = ""
            state.lastTextValue = ""
            dispatch(.clearArray)
            dispatch(.getMovies(""))
        }
    }

    func fetchMoreIfNeeded(at index: Int) {
        guard index >= state.movies.count - loadMorePagesOffset, !state.isLoading else { return }

        currentPage+=1

        state.isLoading = true
        dispatch(.getMovies(state.lastTextValue))
    }

    private func fetchMovies(for searchTerm: String) async {
        let movies = try? await self.moviesUseCase.getMovies(
            page: currentPage,
            searchCriteria: searchTerm
        ).results ?? []

        await fillData(with: movies ?? [])
    }

    @MainActor
    private func fillData(with movies: [MovieEntity]) {
        state.movies.append(contentsOf: movies)
        state.isLoading = false
    }
}
