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
    let maxWidthforIpad: CGFloat = 700
    
    var body: some View {
        ZStack{
//            Map(coordinateRegion: $vm.mapRegion)
          mapLayer
                .padding(.vertical,-100)
                .clipped()
            .ignoresSafeArea()
            VStack{
                header
                .frame(maxWidth: maxWidthforIpad)
                .background(.thickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: Color.black,radius: 20,x:0,y:15)
                .padding()
                Spacer()
               locationCard
            }
        }
        .sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
            LocationDetailView(location: location)
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}

extension LocationsView{
    
    private var header: some View{
        
        VStack {
            Button(action: vm.toogleLocationsMenu) {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .fontWeight(.black)
                    .font(.title2)
                    .foregroundStyle(UITraitCollection.current.userInterfaceStyle == .dark ? .white : .black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundStyle(UITraitCollection.current.userInterfaceStyle == .dark ? .white : .black)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsMenu ? 180 : 0))
                    }
            }
            if(vm.showLocationsMenu){
                LocationsMenu()
            }
        }
    }
    
    private var mapLayer: some View {
        Map(coordinateRegion: $vm.mapRegion, annotationItems: vm.locations, annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                MapAnnotationView()
                    .scaleEffect(location == vm.mapLocation ? 1 : 0.7)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        })
    }
    
    private var locationCard: some View {
        ForEach(vm.locations){ location in
            if(location == vm.mapLocation){
                LocationPreviewView(location: vm.mapLocation)
                    .frame(maxWidth: maxWidthforIpad)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .shadow(color: .black.opacity(0.3),radius: 20)
                    .padding()
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            }
        }
    }
    
}
