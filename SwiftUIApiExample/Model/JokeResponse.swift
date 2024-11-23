//
//  JokeResponse.swift
//  SwiftUIApiExample
//
//  Created by Avijeet Pandey on 24/11/24.
//

// MARK: - JokeResponse
struct JokeResponse: Codable {
    let jokes: [Joke]
    
    // coding key
    private enum CodingKeys: String, CodingKey {
        case jokes
    }
}

// MARK: - Joke
struct Joke: Codable {
    let category: String?
    let type: String?
    let setup: String?
    let delivery: String?
    let joke: String?
    
    // coding keys
    private enum CodingKeys: String, CodingKey {
        case category
        case type
        case setup
        case delivery
        case joke
    }
}
