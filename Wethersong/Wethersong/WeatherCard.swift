import SwiftUI

struct WeatherCard: View {
    
    var title: String
    var icon: String
    var gradient: [Color]
    var destination: AnyView 
    var width: CGFloat = 160
    
    var body: some View {
        NavigationLink(destination: destination) {
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    LinearGradient(
                        colors: gradient,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: width, height: width * 1.2)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                .overlay(
                    VStack(spacing: 12) {
                        Image(systemName: icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: width * 0.3, height: width * 0.3)
                            .foregroundColor(.white)
                        
                        Text(title)
                            .font(.system(size: width * 0.12, weight: .medium))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                )
        }
        .buttonStyle(PlainButtonStyle()) // Убирает синий цвет навигации
    }
}
