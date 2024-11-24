//
//  JokeViewModel.swift
//  SwiftUIApiExample
//
//  Created by Avijeet Pandey on 24/11/24.
//

import SwiftUI

// MARK: - JokeViewModel
@MainActor
class JokeViewModel: ObservableObject {
    @Published var jokes: [Joke] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    func fetchJokes() async throws {
        isLoading = true
        errorMessage = nil
        do {
            let fetchedResponse = try await JokesService.shared.fetchJokes()
            jokes = fetchedResponse
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
