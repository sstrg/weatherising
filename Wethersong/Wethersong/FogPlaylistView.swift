import SwiftUI
import AVFoundation

struct FogPlaylistView: View {
    
    @State private var player: AVAudioPlayer?
    
    let songs = [
        ("Sweater Weather", "Sweater_Weather"),
        ("Another Love", "Another_Love"),
        ("Slow Dancing in the Dark", "Slow_Dancing"),
        ("Space Song", "Space_Song")
    ]
    
    func playSong(fileName: String) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch {
                print("Ошибка воспроизведения")
            }
        }
    }
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color.gray.opacity(0.9),
                    Color.gray.opacity(0.6),
                    Color.black.opacity(0.6)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                
                Image(systemName: "cloud.fill")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .foregroundColor(.white)
                    .padding()
                
                Text("Fog 🌫️")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer(minLength: 16)
                
                List(songs, id: \.0) { song in
                    Button {
                        playSong(fileName: song.1)
                    } label: {
                        HStack {
                            Image(systemName: "music.note.list")
                                .foregroundColor(.gray)
                            
                            Text(song.0)
                                .foregroundColor(.white)
                        }
                    }
                    .scrollContentBackground(.hidden)
                }
            }
        }
    }
}
