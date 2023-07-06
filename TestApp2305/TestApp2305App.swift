//
//  TestApp2305App.swift
//  TestApp2305
//
//  Created by matsumoto kouhei on 2023/05/28.
//

import SwiftUI

@main
struct TestApp2305App: App {
    @StateObject var sharedData = SharedData()
    @Environment(\.colorScheme) var colorScheme
        
        var body: some Scene {
            WindowGroup {
                ContentView()
                    .environmentObject(sharedData)
                    .preferredColorScheme(.dark) // ダークモードに設定
            }
        }
}
