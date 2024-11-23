//
//  SingleJokeView.swift
//  SwiftUIApiExample
//
//  Created by Avijeet Pandey on 24/11/24.
//

import SwiftUI

struct SingleJokeView: View {
    let joke: String
    
    var body: some View {
        VStack {
            Text(joke)
                .font(.headline)
                .padding()
        }
    }
}
