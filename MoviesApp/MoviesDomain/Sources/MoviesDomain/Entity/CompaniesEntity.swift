//
//  CompaniesEntity.swift
//
//
//  Created by Nikola Savic on 1.4.24.
//

import Foundation

public struct CompaniesEntity: Equatable {
    public let id: Int
    public let logoPath: String?
    
    public init(
        id: Int,
        logoPath: String?
    ) {
        self.id = id
        self.logoPath = logoPath
    }
}
