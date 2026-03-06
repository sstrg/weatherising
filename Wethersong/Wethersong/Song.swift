//
//  Song.swift
//  Wethersong
//
//  Created by Tyoma Salamatin on 06.03.2026.
//

import Foundation

struct Song: Identifiable {
    let id = UUID()
    let title: String
    let fileName: String
}
