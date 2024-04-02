//
//  View+If.swift
//  MoviesApp
//
//  Created by Nikola Savic on 1.4.24
//

import SwiftUI

public extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
