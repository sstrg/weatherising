//
//  PlayerView.swift
//  Wethersong
//
//  Created by Tyoma Salamatin on 06.03.2026.
//

import SwiftUI
import Combine

struct PlayerView: View {
    
    @StateObject var player = AudioPlayerManager.shared
    
    let song: Song
    
    var body: some View {
        
        HStack {
            
            VStack(alignment: .leading) {
                Text(song.title)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            Button {
                if player.isPlaying {
                    player.pause()
                } else {
                    player.resume()
                }
            } label: {
                
                Image(systemName: player.isPlaying ? "pause.fill" : "play.fill")
                    .font(.title2)
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(16)
        .padding()
    }
}

