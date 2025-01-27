//
//  LocationsMenu.swift
//  MapApp
//
//  Created by MAC on 27/01/2025.
//

import SwiftUI

struct LocationsMenu: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        List{
            ForEach(vm.locations){ location in
                HStack{
                    if let imageName = location.imageNames.first{
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 45,height: 45)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    VStack(alignment: .leading){
                        Text(location.name)
                            .font(.headline)
                        Text(location.cityName)
                            .font(.subheadline)
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                }
               
            }
        }
    }
}

#Preview {
    LocationsMenu()
        .environmentObject(LocationsViewModel())
}
