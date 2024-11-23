//
//  JokesView.swift
//  SwiftUIApiExample
//
//  Created by Avijeet Pandey on 24/11/24.
//

import SwiftUI

struct JokesView: View {
    @State var jokes: [Joke] = []
    @State var isLoading: Bool = false
    @State var errorMessage: String?
    
    var body: some View {
        if let errorMessage = errorMessage {
            Text("Oops something went wrong \(errorMessage)")
        }
        
        if isLoading {
            ProgressView()
        } else {
            List(jokes, id: \.id) { joke in
                if joke.type == "single" {
                    SingleJokeView(joke: joke.joke ?? "")
                } else {
                    DoubleJokeView(setup: joke.setup ?? "",
                                   delivery: joke.delivery ?? "")
                }
            }
        }
        
        Button("Fetch Jokes") {
            isLoading.toggle()
            Task {
                do {
                    jokes = try await JokesService.shared.fetchJokes()
                    isLoading.toggle()
                } catch {
                    errorMessage = error.localizedDescription
                }
            }
        }
    }
}


#Preview {
    JokesView()
}
