//
//  ContentView.swift
//  Ahmed_Dadabai_Tutorial1
//
//  Created by ahmed casual on 11/29/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var mapAPI = MapAPI()
    @State private var text = ""
    
    var body: some View {
        VStack {
            TextField("Enter an Address", text: $text)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            Button("Find Address"){
                mapAPI.getLocation(address: text, delta: 0.5)
                
            }
            
            Map(coordinateRegion: $mapAPI.region, annotationItems: mapAPI.locations){
                location in
                MapMarker(coordinate: location.coordinate, tint: .blue)
                
                
            }
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
