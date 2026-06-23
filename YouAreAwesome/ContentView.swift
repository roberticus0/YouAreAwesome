//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Rob Guldi on 4/29/26.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var index = -1
    let messages = ["You are Awesome!", "You are Great!", "You are Fantastic!", "Fabulous? That's You!"]
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Image("image\(index)")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
                .clipShape(RoundedRectangle(cornerRadius: 30))
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button("Press Me!") {
                
                index = (index + 1) % messages.count
                message = messages[index]
                print(index, message)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
