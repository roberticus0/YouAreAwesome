//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Rob Guldi on 4/29/26.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var soundName = ""
    @State private var lastImageNumber = -1
    @State private var lastMessageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer : AVAudioPlayer!
    let numberOfImages = 10
    let numberOfSounds = 6
    
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
            
            Spacer()
            
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
                var soundNumber : Int
                
                repeat {
                    messageNumber = Int.random(in:0..<messages.count)
                } while messageNumber == lastMessageNumber
                
                repeat {
                    imageNumber = Int.random(in:0...numberOfImages-1)
                } while imageNumber == lastImageNumber
                
                repeat {
                    soundNumber = Int.random(in:0...numberOfSounds-1)
                } while soundNumber == lastSoundNumber
                
                message = messages[messageNumber]
                imageName = "image\(imageNumber)"
                soundName = "sound\(soundNumber)"
                
                lastMessageNumber = messageNumber
                lastImageNumber = imageNumber
                lastSoundNumber = soundNumber
                
                guard let soundFile = NSDataAsset(name: soundName) else {
                    print("🛑 Could not read the file named \(soundName)")
                    return
                }
                
                do {
                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play()
                } catch {
                    print("🛑 [ERROR]: \(error.localizedDescription) creating audioPlayer")
                }
                
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
