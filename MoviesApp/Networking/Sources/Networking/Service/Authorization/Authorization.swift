//
//  Authorization.swift
//
//
//  Created by Nikola Savic on 1.4.24.
//

import Foundation

public struct Authorization: Codable {
    public var accessToken: String
    public var refreshToken: String

    public init(accessToken: String, refreshToken: String) {
        self.accessToken = accessToken
        self.refreshToken = refreshToken
    }
}
