//
//  LocationDetailView.swift
//  MapApp
//
//  Created by MAC on 31/01/2025.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    let location: Location
    
    var body: some View {
        ScrollView{
            VStack{
               imageSection
                    .shadow(color: .black.opacity(0.3), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/,x: 0,y: 10)
                
                VStack(alignment: .leading,spacing: 16){
                    VStack(alignment: .leading,spacing: 8){
                        Text(location.name)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        Text(location.cityName)
                            .font(.title3)
                            .foregroundStyle(.secondary)
                        Divider()
                        Text(location.description)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        if let url = URL(string: location.link){
                            Link("Read more on Wikipedia",destination: url)
                                .font(.headline)
                                .tint(.blue)
                        }
                        Divider()
                        mapLayer
                    }
                    .frame(maxWidth:  UIScreen.main.bounds.width,alignment: .leading)
                    .padding()
                    
                }
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(backButton,alignment: .topLeading)
    }
}

#Preview {
    LocationDetailView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())
}

extension LocationDetailView{
    
    private var imageSection: some View{
        TabView {
            ForEach(location.imageNames,id: \.self){
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? nil : UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var mapLayer: some View{
        Map(position: .constant(.region(MKCoordinateRegion(center: location.coordinates, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))))){
            Annotation(location.name,coordinate: location.coordinates){
                MapAnnotationView()
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
        }
        .allowsHitTesting(false)
        .aspectRatio(1,contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
    
    private var backButton: some View{
        Button{
            vm.sheetLocation = nil
        }label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundStyle(.black)
                .background(.thickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 4)
                .padding()
        }
    }
}
