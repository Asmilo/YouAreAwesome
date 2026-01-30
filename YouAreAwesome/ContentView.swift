//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Michiel Nooij on 19/01/2026.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State private var soundIsOn = true
    
    @State private var message = ["You are Awesome !", "Wow, so this is how you do it !", "Congrats, looking good !", "It looks so simple how you do it", "Can't wait to see more", "Thinking 'bout the way, you did that", "Can't wait to see more","Amazing, that looks so good", "Holy crap, is that you ?", "Am I the last one to understand this beauty ?"]
    
    @State private var messageTitle = ""
    @State private var imageName = ""
    @State private var imageNumber = 0
    
    @State private var lastMessageNumber = 0
    @State private var lastImageNumber = 0
    @State private var lastSoundNumber = 0
    
    @State private var messageNumber = 0
    @State private var numberofImages = 10
    @State private var numberOfSounds = 5
    
    @State private var soundNumber = 0
    
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
            
            HStack {
                Text("Sound on")
                    .padding(.leading, 10)
                Toggle("Sound on:", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) {
                        if audioPlayer != nil && audioPlayer.isPlaying {
                            audioPlayer.stop()
                        }
                    }
                Spacer()
                Button("Push Me"){
                    
                    // Update Image....
                    
                    imageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBounds: numberofImages)
                    lastImageNumber = imageNumber
                    
                    //Update Message....
                    messageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBounds: message.count)
                    lastMessageNumber = messageNumber
                    
                    //Update Sound....
                    
                    soundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBounds: numberOfSounds)
                    lastSoundNumber = soundNumber
                    
                    playSound()
                    
                    messageTitle = message[messageNumber]
                    imageName = "image\(imageNumber)"
                    
                    
                }
                .buttonStyle(.glassProminent)
                .font(.title2)
                .padding(.trailing, 30)
            }
        }
        .padding()
    }
    
    func nonRepeatingRandom(lastNumber: Int, upperBounds: Int) -> Int {
        
        var newNumber: Int
        
        repeat {
            newNumber = Int.random(in: 0...upperBounds-1)
        } while newNumber == lastNumber
        
        return newNumber
    }
    
    func playSound(){
        
        if soundIsOn == true {
            
            guard let soundFile = NSDataAsset(name: "sound\(soundNumber)") else {
                print("😡 Error in coverting sound from playsound")
                return
            }
            
            do {
                audioPlayer = try AVAudioPlayer(data: soundFile.data)
                audioPlayer.play()
            }
            catch {
                print("😡 Error in coverting sound from soundFile: \(error)")
                return
            }
        }
 

    }
}

#Preview {
    ContentView()
}

