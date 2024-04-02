//
//  MoviesViewModel.swift
//
//
//  Created by Nikola Savic on 1.4.24.
//

import Foundation

public protocol ViewModel: ObservableObject {
    associatedtype State: Equatable
    associatedtype Action
    func dispatch(_ action: Action)
}

public struct EmptyState: Equatable {}
