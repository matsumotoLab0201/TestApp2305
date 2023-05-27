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
        
        var body: some Scene {
            WindowGroup {
                ContentView()
                    .environmentObject(sharedData)
            }
        }
}
