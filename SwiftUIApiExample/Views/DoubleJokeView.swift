//
//  DoubleJokeView.swift
//  SwiftUIApiExample
//
//  Created by Avijeet Pandey on 24/11/24.
//

import SwiftUI

struct DoubleJokeView: View {
    let setup: String
    let delivery: String
    
    var body: some View {
        VStack {
            Text(setup)
                .font(.headline)
                .padding()
            Text(delivery)
                .font(.body)
                .padding()
        }
    }
}
