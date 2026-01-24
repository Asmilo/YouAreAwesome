//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Michiel Nooij on 19/01/2026.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State private var message = ["You are Awesome !", "Wow, so this is how you do it !", "Congrats, looking good !", "It looks so simple how you do it", "Can't wait to see more", "Thinking 'bout the way, you did that", "Can't wait to see more","Amazing, that looks so good", "Holy crap, is that you ?", "Am I the last one to understand this beauty ?"]
   
    @State private var messageTitle = ""
    @State private var imageName = ""
    @State private var imageNumber = 0
    
    @State private var lastMessageNumber = 0
    @State private var lastImageNumber = 0
    
    @State private var messageNumber = 0
    @State private var numberofImages = 10
    @State private var numberOfSounds = 5
    
    @State private var soundName = ""
    
    @State private var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        
        VStack{

            Text(messageTitle)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 50)
                .animation(.default, value: imageName)
              
            
            Spacer()
            Button("Push Me"){
                
                repeat {
                    imageNumber = Int.random(in: 0...numberofImages-1)
                } while imageNumber == lastImageNumber
                
                lastImageNumber = imageNumber
                
                repeat {
                    messageNumber = Int.random(in: 0...message.count-1)
                } while messageNumber == lastMessageNumber
                
                lastMessageNumber = messageNumber
                
                print (messageNumber)
                
                var previousSoundName = soundName
                
                repeat {
                    soundName = "sound\(Int.random(in: 0...numberOfSounds-1))"
                }  while soundName == previousSoundName
                
                previousSoundName = soundName
                
                
                guard let soundFile = NSDataAsset(name: soundName) else {
                    print("😡 Error in coverting sound from playsound")
                    return
                }
                
                do {
                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play()
                    print(soundName, messageTitle, imageName)
                }
                catch {
                    print("😡 Error in coverting sound from soundFile: \(error)")
                    return
                }
                
                messageTitle = message[messageNumber]
                imageName = "image\(imageNumber)"
                imageNumber += 1
                
                            
            }
            .buttonStyle(.glassProminent)
            .font(.title2)
        }
        .padding()
        
        
    }
}

#Preview {
    ContentView()
}

