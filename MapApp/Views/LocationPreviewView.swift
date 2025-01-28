//
//  LocationPreviewView.swift
//  MapApp
//
//  Created by MAC on 28/01/2025.
//

import SwiftUI

struct LocationPreviewView: View {
    let location: Location
    var body: some View {
        HStack(alignment: .bottom,spacing: 0) {
            VStack(alignment: .leading,spacing: 16){
                imageSection
                titleSection
            }
            VStack(spacing: 8){
                learnMoreButton
                nextButton
                
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    ZStack {
        Color.green.ignoresSafeArea()
        LocationPreviewView(location: LocationsDataService.locations.first!)
    }
}

extension LocationPreviewView{
    
    private var imageSection: some View {
        ZStack{
            if let imageNames = location.imageNames.first{
                Image(imageNames)
                    .resizable()
                    .scaledToFill()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
              
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private var titleSection: some View {
        VStack(alignment:.leading,spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity,alignment: .leading)
    }
    
    private var learnMoreButton: some View {
        Button{
            
        } label: {
            Text("Learn More")
                .frame(width: 125,height: 35)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View{
        Button{
            
        } label: {
            Text("Next")
                .frame(width: 125,height: 35)
        }
        .buttonStyle(.bordered)
    }
    
}
