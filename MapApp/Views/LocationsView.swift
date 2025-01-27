//
//  LocationsView.swift
//  MapApp
//
//  Created by MAC on 27/01/2025.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $vm.mapRegion)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
