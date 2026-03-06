import SwiftUI
import AVFoundation

struct SnowPlaylistView: View {
    
    @State private var player: AVAudioPlayer?
    
    let songs = [
        ("Let down", "Let_Down"),
        ("Let It Snow", "let_it_snow"),
        ("Glory of the snow", "Glory_of_the_Snow"),
        ("Kill Bill", "Kill_Bill")
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
                colors: [Color.cyan.opacity(0.7), Color.blue.opacity(0.8), Color.white],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                Image(systemName: "snowflake")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .foregroundColor(.white)
                    .padding()
                
                Text("Snow ❄️")
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
