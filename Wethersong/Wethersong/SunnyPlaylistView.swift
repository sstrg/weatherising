import SwiftUI
import AVFoundation

struct SunnyPlaylistView: View {
    
    @State private var player: AVAudioPlayer?
    
    let songs = [
        ("Safe and sound", "Safe_And_Sound"),
        ("Cake by the ocean", "Cake_By_The_Ocean"),
        ("Dont worry", "Dont_Worry"),
        ("Riptide", "Riptide")
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
            LinearGradient(colors: [Color.yellow.opacity(0.7), Color.green.opacity(0.7), Color.blue.opacity(0.5)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Image(systemName: "sun.max.fill")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .foregroundColor(.white)
                    .padding()
                Text("Sunny ☀️")
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
                                .foregroundColor(.cyan)
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
