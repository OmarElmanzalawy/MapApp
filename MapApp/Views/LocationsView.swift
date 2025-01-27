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
            
            VStack{
                header
                .background(.thinMaterial)
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
        
        VStack{
            Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                .fontWeight(.black)
                .font(.title2)
                .foregroundStyle(.primary)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading) {
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .foregroundStyle(.primary)
                        .padding()
                }
            
        }
        
    }
    
}
