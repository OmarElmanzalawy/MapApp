//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by MAC on 27/01/2025.
//

import Foundation
import MapKit

class LocationsViewModel: ObservableObject{
    @Published var locations: [Location]
    
    @Published var mapLocation: Location{
        didSet{
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location){
        mapRegion = MKCoordinateRegion(
            center: location.coordinates,
            span: mapSpan
        )
    }
}
