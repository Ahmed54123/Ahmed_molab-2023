//
//  MapView.swift
//  localShare_App
//
//  Created by ahmed casual on 12/14/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject private var viewModel = ContentViewModel()

    var body: some View {
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
            .ignoresSafeArea()
            .accentColor(Color(.systemPink))
            .onAppear{
                viewModel.checkIfLocationEnabled()
            }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
