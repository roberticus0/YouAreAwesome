//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Rob Guldi on 4/29/26.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            
            Spacer()
            
            Button("Press Me!") {
                
                let message1 = "You are Awesome!"
                let message2 = "You are Great!"
                let imageString1 = "sun.max.fill"
                let imageString2 = "hand.thumbsup"
                
                message = message == message1 ? message2 : message1
                imageName = imageName == imageString1 ? imageString2 : imageString1
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
