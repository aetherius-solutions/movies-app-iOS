//
//  MovieRowView.swift
//  MoviesApp
//
//  Created by Nikola Savic on 1.4.24.
//

import SwiftUI

struct MovieRowView: View {
    @StateObject var viewModel: MovieRowViewModel

    var body: some View {
        VStack(spacing: 6) {
            HStack(spacing: 6) {
                if let imagePath = viewModel.state.movie.posterPath {
                    image(url: URL(string: "\(Configuration.posterBaseUrl ?? "")\(imagePath)"))
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(viewModel.state.movie.title ?? "")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.white)
                    
                    HStack(spacing: 8) {
                        Image(.iconStar)
                        Text("**\(String(format:"%.2f", viewModel.state.movie.voteAverage ?? 0))**/10")
                            .font(.system(size: 14))
                            .foregroundStyle(.white)
                    }

                    HStack(spacing: .zero) {
                        Text("Budget: ")
                            .font(.system(size: 12))
                            .foregroundStyle(.white)

                        if let budget = viewModel.state.movie.budget {
                            Text(budget, format: .currency(code: "USD"))
                                .font(.system(size: 12))
                                .foregroundStyle(.white)
                        } else {
                            Text("Not disclosed")
                                .font(.system(size: 12))
                                .foregroundStyle(.white)
                        }
                    }
                }
                
                Spacer()
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .overlay(
            VStack {
                Spacer()
                Color.white.frame(height: 0.5)
            }.padding(.horizontal, 16)
        )
        .onTapGesture {
            viewModel.dispatch(.itemTapped)
        }
        .task {
            viewModel.dispatch(.fetchDetails)
        }
    }
    
    private func image(url: URL?) -> some View {
        AsyncImage(url: url) { phase in
            if let image = phase.image {
                content(image: image)
            } else if phase.error != nil {
                Rectangle()
                    .frame(width: 84, height: 84)
                    .foregroundStyle(Color.darkWhite)
                    .roundedRectangleBackground(
                        backgroundColor: .clear,
                        cornerRadius: 8,
                        borderColor: .clear,
                        borderWidth: 0
                    )
            } else {
                ProgressView()
                    .controlSize(.regular)
                    .tint(.white)
                    .frame(width: 84, height: 84)
            }
        }
    }
    
    private func content(image: Image) -> some View {
        image
            .resizable()
            .frame(width: 83, height: 77)
            .scaledToFill()
            .roundedRectangleBackground(
                backgroundColor: .clear,
                cornerRadius: 8,
                borderColor: .clear,
                borderWidth: 0
            )
    }
}
