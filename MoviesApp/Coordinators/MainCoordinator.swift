//
//  MainCoordinator.swift
//  MoviesApp
//
//  Created by Nikola Savic on 29.3.24.
//

import UIKit
import MoviesDomain

final class MainCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    func begin() {
        showSplashScreen()
    }
    
    public init(
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
    }
    
    private func showSplashScreen() {
        let vc = MoviesListScreen(
            viewModel: .init(
                onMovieTapped: { movie in
                    self.showDetailsScreen(movie: movie)
                }
            )
        ).hosted
        
        pushViewController(vc)
    }
    
    private func showDetailsScreen(movie: MovieEntity) {
        let vc = MoviesDetailsScreen(
            viewModel: .init(
                movie: movie,
                onDismiss: {
                    self.popViewController()
                }
            )
        ).hosted
        
        pushViewController(vc)
    }
}
