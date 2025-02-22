//
//  MapAnnotationView.swift
//  MapApp
//
//  Created by MAC on 30/01/2025.
//

import SwiftUI

struct MapAnnotationView: View {
    let accentColor = Color("AccentColor")
    var body: some View {
        VStack(spacing:0){
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30,height: 30)
                .font(.headline)
                .foregroundStyle(.white)
                .padding(6)
                .background(accentColor)
                .clipShape(RoundedRectangle(cornerRadius: 36))
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 10,height: 10)
                .foregroundStyle(accentColor)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
        }
    }
}

#Preview {
    MapAnnotationView()
}
