//
//  JokesView.swift
//  SwiftUIApiExample
//
//  Created by Avijeet Pandey on 24/11/24.
//

import SwiftUI

struct JokesView: View {
    @StateObject var viewModel = JokeViewModel()
    
    var body: some View {
        if let errorMessage = viewModel.errorMessage {
            Text("Oops something went wrong \(errorMessage)")
        }
        
        if viewModel.isLoading {
            ProgressView()
        } else if !viewModel.isLoading {
            List(viewModel.jokes, id: \.id) { joke in
                if joke.type == "single" {
                    SingleJokeView(joke: joke.joke ?? "")
                } else {
                    DoubleJokeView(setup: joke.setup ?? "",
                                   delivery: joke.delivery ?? "")
                }
            }
        }
        
        Button("Fetch Jokes") {
            Task {
                try await viewModel.fetchJokes()
            }
        }
    }
}


#Preview {
    JokesView()
}
