//
//  View+UIHostingController.swift
//  MoviesApp
//
//  Created by Nikola Savic on 29.3.24.
//

import SwiftUI

extension View {
    var hosted: UIViewController {
        return UIHostingController(rootView: self)
    }
}
