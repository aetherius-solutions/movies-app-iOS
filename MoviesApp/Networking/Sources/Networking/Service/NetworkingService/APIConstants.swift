//
//  APIConstants.swift
//  
//
//  Created by Nikola Savic on 1.4.24.
//

import Foundation

public struct APIConstants {
    public static let baseURL = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String ?? ""
    public static let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String ?? ""
}
