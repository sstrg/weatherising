//
//  AudioPlayerManager.swift
//  Wethersong
//
//  Created by Tyoma Salamatin on 06.03.2026.
//

import Foundation
import Combine
import AVFoundation

class AudioPlayerManager: ObservableObject {
    
    static let shared = AudioPlayerManager()
    
    private var player: AVAudioPlayer?
    
    @Published var isPlaying = false
    @Published var currentSong: Song?
    
    func play(song: Song) {
        guard let url = Bundle.main.url(forResource: song.fileName, withExtension: "mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
            currentSong = song
            isPlaying = true
        } catch {
            print("Ошибка воспроизведения")
        }
    }
    
    func pause() {
        player?.pause()
        isPlaying = false
    }
    
    func resume() {
        player?.play()
        isPlaying = true
    }
}

