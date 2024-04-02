//
//  MoviesListAPIRequest.swift
//
//
//  Created by Nikola Savic on 1.4.24.
//

import Foundation

public struct MoviesListAPIRequest: MoviesGetAPIRequest {
    public typealias ResponseType = MoviesEntityDTO
    
    public var endpoint: String { "discover/movie"}
    public var authorization: Authorization?
    
    private let page: Int
    
    public var queryItems: [URLQueryItem] {
        [
            .init(name: "language", value: "en-US"),
            .init(name: "page", value: "\(page)")
        ]
    }
    
    public init(
        authorization: Authorization?,
        page: Int
    ) {
        self.authorization = authorization
        self.page = page
    }
}
