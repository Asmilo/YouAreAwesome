//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Michiel Nooij on 19/01/2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var exampleText = ""
    @State private var exampleImage = ""
    
    var body: some View {
        
        VStack{
            Spacer()
            Image(systemName: exampleImage)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text(exampleText)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            Spacer()
            Button("Push Me"){
                
                let message1 = "You are Awesome !"
                let message2 = "You are Great !"
                let image1 = "hand.thumbsup"
                let image2 = "sun.max.fill"
                
                exampleText = (exampleText == message1 ? message2 : message1)
                exampleImage = (exampleImage == image1 ? image2 : image1)
                
            }
            .buttonStyle(.glassProminent)
            .font(.title2)
            .tint(.orange)
        }
        .padding()
        
        
    }
}

#Preview {
    ContentView()
}
