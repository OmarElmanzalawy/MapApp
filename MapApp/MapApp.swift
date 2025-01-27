//
//  MapAppApp.swift
//  MapApp
//
//  Created by MAC on 27/01/2025.
//

import SwiftUI

@main
struct MapApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
