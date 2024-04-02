//
//  Configuration.swift
//  MoviesApp
//
//  Created by Nikola Savic on 1.4.24.
//

import Foundation

final class Configuration {
    static var posterBaseUrl: String? {
        return Bundle.main.object(forInfoDictionaryKey: "POSTER_BASE_URL") as? String
    }
}
