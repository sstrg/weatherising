import SwiftUI
import AVFoundation

struct RainPlaylistView: View {
    
    @State private var player: AVAudioPlayer?
    
    let songs = [
        ("Summer rain", "Summer_rain"),
        ("My home town", "My_Home_Town"),
        ("Dark red", "Dark_Red"),
        ("Mary on a cross", "Mary_On_A_Cross")
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
                gradient: Gradient(colors: [Color.orange, Color.red, Color.brown.opacity(0.7)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                Image(systemName: "cloud.rain.fill")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .foregroundColor(.white)
                    .padding(.top)
                
                Text("Rain 🌧️")
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
