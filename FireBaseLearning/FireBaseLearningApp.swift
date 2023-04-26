//
//  FireBaseLearningApp.swift
//  FireBaseLearning
//
//  Created by Gasc_Internship1 on 24/04/23.
//

import SwiftUI

@main
struct FireBaseLearningApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
        }
    }
}
