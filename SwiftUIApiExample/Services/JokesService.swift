//
//  JokesService.swift
//  SwiftUIApiExample
//
//  Created by Avijeet Pandey on 24/11/24.
//

import Foundation

struct JokesService {
    static let shared = JokesService()
    private let url = URL(string: "https://v2.jokeapi.dev/joke/Any?amount=10")!
    private init() {}
    
    func fetchJokes() async throws -> [Joke] {
        let request = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            let jokeResponse = try JSONDecoder().decode(JokeResponse.self, from: data)
            return jokeResponse.jokes
        }
    }
}
