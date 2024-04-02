//
//  MoviesGetAPIRequest.swift
//
//
//  Created by Nikola Savic on 1.4.24.
//

import Foundation

public protocol MoviesGetAPIRequest: MoviesAPIRequest {}

public extension MoviesGetAPIRequest {
    func generateURLRequest() -> URLRequest? {
        guard let url = createURL() else {
            return nil
        }
        var request = URLRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: 60)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "accept")
        if let authentication = authorization {
            request.setValue("Bearer \(authentication.accessToken)", forHTTPHeaderField: "Authorization")
        }
        return request
    }
}
