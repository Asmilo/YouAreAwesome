//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Michiel Nooij on 19/01/2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var message = "You are Awesome !"
    
    var body: some View {
        
        VStack{
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            
            Button{
                message = "I am a programmer"
            }
        label: {
                Text("Click Me !")
            }
        }
        
        
    }
}

#Preview {
    ContentView()
}
