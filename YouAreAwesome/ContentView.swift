//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Michiel Nooij on 19/01/2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var exampleText = ""
    @State private var imageName = ""
    
    var body: some View {
        
        VStack{
            Spacer()
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 30)
            Text(exampleText)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            Spacer()
            Button("Push Me"){
                
                let message1 = "You are Awesome !"
                let message2 = "You are Great !"
                
                exampleText = (exampleText == message1 ? message2 : message1)
                imageName = (imageName == "image0" ? "image1" : "image0")
                
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
