//
//  tiktaktoeApp.swift
//  tiktaktoe
//
//  Created by Ricardo Paredes on 7/10/23.
//

import SwiftUI

@main
struct tiktaktoeApp: App {
    @StateObject var game = GameService()
    var body: some Scene {
        WindowGroup {
            JuegoView().environmentObject(game)
        }
    }
}
