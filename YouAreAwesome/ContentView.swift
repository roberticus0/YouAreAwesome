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
    @State private var lastImageNumber = -1
    @State private var lastMessageNumber = -1
    
    
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
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            Spacer()
            
            Button("Press Me!") {
                
                var messageNumber : Int
                var imageNumber : Int
                
                repeat {
                    messageNumber = Int.random(in:0..<messages.count)
                    
                } while messageNumber == lastMessageNumber
                
                
                repeat {
                    
                    imageNumber = Int.random(in:0...9)
                    
                } while imageNumber == lastImageNumber
                
                message = messages[messageNumber]
                imageName = "image\(imageNumber)"
                
                
                lastMessageNumber = messageNumber
                lastImageNumber = imageNumber
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
