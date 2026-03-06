import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 15) {
                Text("Chooise weather")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 15) {
                    WeatherCard(
                        title: "Sunny",
                        icon: "sun.max.fill",
                        gradient: [Color.orange, Color.yellow],
                        destination: AnyView(SunnyPlaylistView())
                    )
                    
                    WeatherCard(
                        title: "Fog",
                        icon: "cloud.fill",
                        gradient: [Color.gray, Color.white.opacity(0.7)],
                        destination: AnyView(FogPlaylistView())
                    )
                    
                    WeatherCard(
                        title: "Rain",
                        icon: "cloud.rain.fill",
                        gradient: [Color.blue, Color.gray],
                        destination: AnyView(RainPlaylistView())
                    )
                    
                    WeatherCard(
                        title: "Snow",
                        icon: "snowflake",
                        gradient: [Color.cyan, Color.white],
                        destination: AnyView(SnowPlaylistView())
                    )
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
            .navigationTitle("Weather Music")
        }
    }
}
