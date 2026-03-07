import SwiftUI

struct WeatherButton: View {
    
    var image: String
    var color: Color
    var size: CGFloat = 120
    
    var body: some View {
        Circle()
            .fill(color.opacity(0.2))
            .frame(width: size, height: size)
            .overlay(
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: size * 0.4)
                    .foregroundColor(color)
            )
            .shadow(color: color.opacity(0.3), radius: 5, x: 0, y: 2)
    }
}

struct WeatherButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 20) {
            WeatherButton(image: "sun.max.fill", color: .orange)
            WeatherButton(image: "cloud.rain.fill", color: .blue)
            WeatherButton(image: "wind", color: .green)
            WeatherButton(image: "snowflake", color: .cyan)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
