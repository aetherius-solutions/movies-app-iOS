//
//  MoviesEntityDTO.swift
//
//
//  Created by Nikola Savic on 1.4.24.
//

import Foundation

public struct MoviesEntityDTO: Decodable {
    public let page: Int
    public let results: [MovieEntityDTO]?
    public let total_pages: Int?
    public let total_results: Int?
}
