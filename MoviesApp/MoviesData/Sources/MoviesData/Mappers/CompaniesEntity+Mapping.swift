//
//  CompaniesEntity+Mapping.swift
//
//
//  Created by Nikola Savic on 1.4.24.
//

import Foundation
import MoviesDomain
import Networking

extension CompaniesEntityDTO {
    func toCompaniesEntity() -> CompaniesEntity {
        return .init(
            id: id,
            logoPath: logoPath
        )
    }
}
