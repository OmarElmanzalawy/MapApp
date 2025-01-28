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
                .padding(.vertical,-100)
                .clipped()
            .ignoresSafeArea()
            
            
            VStack{
                header
                .background(.thickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: Color.black,radius: 20,x:0,y:15)
                .padding()
                Spacer()
            }
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
                    .foregroundStyle(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundStyle(.black)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsMenu ? 180 : 0))
                    }
                
            }
            if(vm.showLocationsMenu){
                LocationsMenu()
            }
        }
      
        
    }
    
}
