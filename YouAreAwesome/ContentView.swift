//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Rob Guldi on 4/29/26.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var msgIndex = -1
    @State private var imgIndex = -1
    let messages = ["You are Awesome!", "You are Great!", "You are Fantastic!", "Fabulous? That's You!", "Gadzooks my friend! I am astohnished at how utterly magnificent you are!", "When the Genius Bar Needs Help, They Call You!"]
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .animation(.easeInOut(duration: 0.15), value: msgIndex)
            
            Image("image\(msgIndex)")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imgIndex)
            
            Spacer()
            
            Button("Press Me!") {
                
                msgIndex = Int.random(in:0..<messages.count)
                message = messages[msgIndex]
                print(msgIndex, message)
                
                imgIndex = Int.random(in: 0...9)
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
