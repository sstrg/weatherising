//
//  AppDelegate.swift
//  Weathersong
//
//  Created by Александр Дворянинов on 05.03.2026.
//

import UIKit
import AVFoundation

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // Настройка аудиосессии для фонового воспроизведения
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.playback, mode: .default, options: [.allowAirPlay, .allowBluetooth])
            try audioSession.setActive(true)
            print("✅ Аудиосессия настроена успешно")
        } catch {
            print("❌ Ошибка настройки аудиосессии: \(error.localizedDescription)")
        }
        
        return true
    }
}
