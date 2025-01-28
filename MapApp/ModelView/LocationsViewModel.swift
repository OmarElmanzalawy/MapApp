//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by MAC on 27/01/2025.
//

import Foundation
import SwiftUI
import MapKit

class LocationsViewModel: ObservableObject{
    //All locations
    @Published var locations: [Location]
    
    //current location
    @Published var mapLocation: Location{
        didSet{
            updateMapRegion(location: mapLocation)
        }
    }
    //current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    //show location menu
    @Published var showLocationsMenu: Bool = false
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location){
        withAnimation(.easeInOut){
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan
            )
        }
    }
    
    func toogleLocationsMenu(){
        withAnimation(.easeInOut) {
            showLocationsMenu.toggle()
        }
    }
    
    func showNextLocation(location:Location){
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsMenu = false
        }
    }
    
}
